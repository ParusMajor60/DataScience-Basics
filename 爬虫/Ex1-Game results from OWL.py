# -*- coding: utf-8 -*-
"""
Python Crawler
Exercise

Game results of OWL
"""

import requests
import bs4


def get_html(url):
    try:
        r = requests.get(url, timeout=30)
        r.raise_for_status()
        r.encoding = r.apparent_encoding
        return r.text
    except:
        return " ERROR "


def print_result(url):
    html = get_html(url)
    soup =  bs4.BeautifulSoup(html,"lxml")
    match_list = soup.find_all('div', attrs={'class': 'MatchRow MatchRow-match'})
    #match_list = soup.find_all('div', attrs={'class': 'MatchRow MatchRow-match','data-analytics-placement':'schedule-matchrow'})
    for match in match_list:       
        #time = match.find('span', attrs={'class': 'Date-monthAndDay'}).text.strip()       
        teamname = match.find_all('div', attrs={'class': 'TeamLabel-name hidden-md hidden-lg'})
        
        team1_name = teamname[0].string
        team2_name = teamname[1].string
        
        team1_score = match.find('span', class_='MatchStatus-score').string
        team2_score = match.find('span', class_='MatchStatus-score is-winner').string
        
        #print('比赛时间：{}，\n 队伍一：{}      胜率 {}\n 队伍二：{}      胜率 {} \n'.format(time,teamname1,team1_score,teamname2,team2_score))
        print('队伍一：{}      胜率 {}\n 队伍二：{}      胜率 {} \n'.format(team1_name,team1_score,team2_name,team2_score))
        
        
def main():
    url= 'https://www.overwatchleague.cn/zh-cn/schedule'
    print_result(url)

if __name__ == '__main__':
    main()