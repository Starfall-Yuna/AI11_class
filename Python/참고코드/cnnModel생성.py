#모델 생성
# 필요한 모듈 임포트
import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2' #CPU버전
import pandas as pd
import tensorflow as tf
from tensorflow.keras import preprocessing
from tensorflow.keras.models import Model
from tensorflow.keras.layers import Input, Embedding, Dense, Dropout, Conv1D, GlobalMaxPool1D, concatenate

#1 데이터 읽어 오기
train_file = "chatbot_data.csv"
data = pd.read_csv(train_file, delimiter=',') # 판다스로 csv 파일을 읽는다.
features = data['Q'].tolist() #Q 부분만 리스트로 변환
labels = data['label'].tolist()#label(감정) 부분만 리스트로 변환 0:일상다반사, 1:이별(부정), 2:사랑(긍정)

#2 단어 인덱스 시퀀스 벡터
# corpus : 말뭉치
# preprocessing.text.text_to_word_sequence(text)
# features에 있는 문장을 하나씩 꺼내와서 text 변수에 넣는다.
# 텐서플로우에 있는 preprocessing 의 text의 text_to_word_sequenc2e 함수를 이용해 단어 시퀀스를 만든다.
# 단어 시퀀스 : '3박4일 놀러가고 싶다' => ['3박4일', '놀러가고', '싶다']처럼 단어 토큰들의 순차적 리스트
# 이 단어 시퀀스를 corpus 라는 이름의 변수(=리스트)에 저장
corpus = [preprocessing.text.text_to_word_sequence(text) for text in features]
tokenizer = preprocessing.text.Tokenizer() #텐서플로우에 있는 preprocessing 의 text의 토크나이저를 불러옴
tokenizer.fit_on_texts(corpus) # 이렇게 불러온 토크나이저를 이용해 말 뭉치를 임베딩 시킬 수 있는 상태로 변환함
sequences = tokenizer.texts_to_sequences(corpus) #문장 내 모든 단어를 시퀀스 번호를 이용해 단어 임베딩 벡터를 만듦(임베딩을 함)
word_index = tokenizer.word_index

MAX_SEQ_LEN = 15
#벡터 크기가 다 달라서 패딩을 채워야 함(CNN모델은 입력계층의 수가 고정됨)
#패딩이 채워진 상태의 단어 시퀀스
padded_seqs = preprocessing.sequence.pad_sequences(sequences,maxlen=MAX_SEQ_LEN,padding='post')


#3 학습용, 검증용, 테스트용으로 데이터셋 생성
# 학습:검증:테스트 = 7:2:1
ds = tf.data.Dataset.from_tensor_slices((padded_seqs, labels))
ds = ds.shuffle(len(features))

train_size = int(len(padded_seqs)*0.7)
val_size = int(len(padded_seqs)*0.2)
test_size = int(len(padded_seqs)*0.1)

train_ds = ds.take(train_size).batch(20)
val_ds = ds.skip(train_size).take(val_size).batch(20)
test_ds = ds.skip(train_size+val_size).take(test_size).batch(20)

# 하이퍼파라미터 설정
dropout_prob  = 0.5
EMB_SIZE = 128
EPOCH = 5
VOCAB_SIZE = len(word_index)+1

#4 CNN 모델 정의
input_layer = Input(shape=(MAX_SEQ_LEN,))
embedding_layer = Embedding(VOCAB_SIZE, EMB_SIZE, input_length=MAX_SEQ_LEN)(input_layer)
dropout_emb = Dropout(rate=dropout_prob)(embedding_layer)

conv1 = Conv1D(
    filters=128, kernel_size=3, padding='valid',activation=tf.nn.relu
)(dropout_emb)
pool1 = GlobalMaxPool1D()(conv1)

conv2 = Conv1D(
    filters=128, kernel_size=4, padding='valid', activation=tf.nn.relu
)(dropout_emb)
pool2 = GlobalMaxPool1D()(conv2)

conv3 = Conv1D(
    filters=128, kernel_size=5, padding='valid', activation=tf.nn.relu
)(dropout_emb)
pool3 = GlobalMaxPool1D()(conv3)

# 3,4,5-gram 이후 합치기

concat = concatenate([pool1,pool2,pool3])

hidden = Dense(128, activation=tf.nn.relu)(concat)
dropout_hidden = Dropout(rate=dropout_prob)(hidden)
logits = Dense(3, name='logits')(dropout_hidden)
predictions = Dense(3,activation=tf.nn.softmax)(logits)


#5 모델 생성
model = Model(inputs=input_layer, outputs=predictions)
model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])

#6 모델 학습
model.fit(train_ds, validation_data=val_ds, epochs=EPOCH, verbose=1)

#7모델 평가(테스트 데이터셋 이용)
loss, accuracy = model.evaluate(test_ds, verbose=1)
print('Acc : %f' % (accuracy*100))
print('Loss : %f' % (loss))

#8 모델 저장
model.save('cnn_model.h5')