from konlpy.tag import Komoran
#명사를 형태소로 간주, 즉 최소 단위가 명사
#어절 단위 n-gram
# bow : 원본
# num_gram : 몇 개의 어절로 자를 시
def word_ngram(bow, num_gram):
    text = tuple(bow) #원본을 튜플화시킴
    ngrams = [text[x:x+num_gram]
              for x in range(0,len(text))]
    return tuple(ngrams)
#유사도 계산
def similarity(doc1, doc2):
    cnt = 0
    for token in doc1:
        if token in doc2:
            cnt = cnt + 1 #cnt++ 안 됨
    return cnt/len(doc1) #유사도 결과

k = Komoran()
bow1 = k.nouns('6월에 뉴턴은 선생님의 제안으로 입학하였다.')
bow2 = k.nouns('6월에 뉴턴은 교수님의 제안으로 퇴학되었다.')
bow3 = k.nouns('6월에 뉴턴은 교수님의 제안으로 입학하였다.')
doc1 = word_ngram(bow1,2)
doc2 = word_ngram(bow2,2)
doc3 = word_ngram(bow3,2)
print(doc1)
print(doc2)
print(doc3)
print(similarity(doc1,doc2))
print(similarity(doc2,doc3))
print(similarity(doc1,doc3))