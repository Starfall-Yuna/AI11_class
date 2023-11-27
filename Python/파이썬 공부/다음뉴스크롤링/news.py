import requests
from bs4 import BeautifulSoup
import pandas as pd
import re
html = requests.get('http://media.daum.net/ranking/popular/').text
soup = BeautifulSoup(html, 'html.parser')
select_newstitle = soup.select('ul.list_news2>li[data-tiara-layer="news_list"]>div.cont_thumb>strong.tit_thumb>a.link_txt')
select_newscomname = soup.select('span.info_news')
newstitle=[]
newscomname=[]
for i in range(len(select_newstitle)) :
    newstitle.append(select_newstitle[i].text)
    newscomname.append(select_newscomname[i].text)
pd.DataFrame({'newstitle':newstitle, 'newscomname':newscomname}).to_csv("news.csv", index=False, encoding = 'utf-8')
