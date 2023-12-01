# cnn 테스트
import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'


import tensorflow as tf
import pandas as pd
from tensorflow.keras.models import Model, load_model
from tensorflow.keras import preprocessing


#1 데이터 읽어오기
train_file = "chatbot_data.csv"
data = pd.read_csv(train_file,delimiter=',')
features = data['Q'].tolist()

q = input()
features.append(q)

#2 단어 인덱스 시퀀스 벡터
corpus = [preprocessing.text.text_to_word_sequence(text) for text in features]

tokenizer = preprocessing.text.Tokenizer()
tokenizer.fit_on_texts(corpus) #fit_on_texts() 메서드는 문자 데이터를 입력받아서 리스트의 형태로 변환합니다.
sequences = tokenizer.texts_to_sequences(corpus)

MAX_SEQ_LEN  = 15
padded_seqs = preprocessing.sequence.pad_sequences(sequences, maxlen=MAX_SEQ_LEN, padding='post')

#4 감정 분류 CNN 모델 불러 오기
model = load_model('cnn_model.h5')


picks = [len(features)-1]
#picks = [11823]

print(corpus[len(features)-1]) # ['다', '괜찮은', '줄', '알았는데']
print(sequences[len(features)-1]) #[28, 242, 85, 118]
print(padded_seqs[len(features)-1]) #[ 28 242  85 118   0   0   0   0   0   0   0   0   0   0   0]


predict = model.predict(padded_seqs[picks])
predict_class = tf.math.argmax(predict, axis=1)

emotions = {0:"보통", 1:"부정", 2:"긍정"}

print('감정 예측 점수 : ', predict)
print('감정 예측 클래스 : ' , predict_class.numpy())
print('감정 : ' , emotions[predict_class.numpy()[0]])

#너무우울해 1
#안녕하세요 0
#사랑 2
#짝사랑 1
#귀찮게 굴지 마세요