/* 계정 생성*/
--sqlplus / as sysdba
--alter session set "_oracle_script"=true;
--create user team4 identified by java;
--grant connect, resource, unlimited tablespace to team4;
--conn team4/java;
--select * from tab;

-- 테이블       ( 논리 모델명 )      ( 칼럼 )

-- MEMBER        회원	      MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_PHONE, MEMBER_EMAIL_CHECK, MEMBER_RDATE, MEMBER_CHECK 
--                            ( 회원아이디, 회원비밀번호, 회원명, 전화번호, 이메일수신여부, 회원가입일, 크리에이터여부 )
-- BLACKLIST     블랙리스트      BLACKLIST_NUM, MEMBER_ID, BLACKLIST_STOP, BLACKLIST_DATE, BLACKLIST_CNT
--                            ( 블랙리스트번호, 회원아이디, 활동중지여부, 활동중지일, 누적신고수 )
-- ADDRESS       배송지관리       ADDR_NUM, MEMBER_ID, ADDR_NAME, ADDR_RECIVER, ADDR_PHONE, ADDR_POST, ADDR_ROADNAME, ADDR_DETAIL
--                            ( 배송지번호, 회원아이디, 배송지명, 받는이, 받는이번호, 우편번호, 도로명주소, 상세주소)
-- CATEGORY      카테고리        CATEGORY_NUM, CATEGORY_SUB
--                            ( 카테고리번호, 카테고리명 )
-- CREATOR       크리에이터       CREATOR_NUM, CREATOR_TYPE, CREATOR_PHONE, CREATOR_CHECK, CREATOR_NAME
--                            ( 크리에이터번호, 사업자구분, 크리에이터전화번호, 개인정보수집동의여부, 크리에이터이름)
-- PROJECT       프로젝트        PROJECT_NUM, CREATOR_NUM, CATEGORY_NUM, PROJECT_SUB, PROJECT_GOAL, PROJECT_COMMENT, PROJECT_DETAIL, PROJECT_PRICE, PROJECT_OPEN, PROJECT_CLOSE, PROJECT_DATE, PROJECT_MDATE, PROJECT_LEVEL
--                            ( 프로젝트번호, 크리에이터번호, 카테고리번호, 프로젝트제목, 목표금액, 요약, 스토리, 후원금액, 프로젝트오픈일, 프로젝트종료일, 작성일, 수정일, 프로젝트단계 )
-- REWARD        리워드         REWARD_NUM, PROJECT_NUM, REWARD_SUB, REWARD_PRICE, REWARD_CNT, REWARD_DATE
--                            ( 리워드번호, 프로젝트번호, 리워드명, 금액, 제한수량, 발송시작일)
-- ORDER         주문	      ORDER_NUM, ADDR_NUM, REWARD_NUM, MEMBER_ID, ORDER_NAME, ORDER_PRICE, ORDER_DATE, ORDER_STATEMENT, ORDER_OPTION, ORDER_DELIVERY
--                            ( 주문번호, 배송지번호, 리워드번호, 회원아이디, 주문인, 주문금액, 주문일자, 주문상태, 입력옵션내용, 배송단계 )
-- PAYMENT       결제           PAYMENT_NUM, ADDR_NUM, ORDER_NUM, MEMBER_ID, PAYMENT_PAY, PAYMENT_PRICE, PAYMENT_DATE, PAYMENT_TIME
--                            ( 결제번호, 배송지번호, 주문번호, 회원아이디, 결제방식, 결제금액, 결제일자, 결제승인시각 )
-- COMMUNITY     커뮤니티        COMMUNITY_NUM, MEMBER_ID, COMMUNITY_SUB, COMMUNITY_CON, COMMUNITY_DATE, COMMUNITY_MDATE, COMMUNITY_VIEW
--                            ( 커뮤니티글번호, 회원아이디, 커뮤니티제목, 커뮤니티내용, 커뮤니티등록일, 커뮤니티수정일, 커뮤니티조회수 )
-- COMMUNITY_REPLY  커뮤니티댓글   COM_RE_NUM, MEMBER_ID, COMMUNITY_NUM, COM_RE_CON, COM_RE_DATE, COM_RE_MDATE
--                            ( 댓글번호, 회원아이디, 커뮤니티글번호, 댓글내용, 작성일, 수정일 )
-- REPORT        신고           REPORT_NUM, COM_RE_NUM, REPORT_REASON, REPORT_DATE, REPORT_CHECK
--                            ( 신고번호, 댓글번호, 신고사유, 신고일, 신고처리여부 )
-- QNA           질문게시판       QNA_NUM, QNA_SUB, QNA_CON, QNA_DATE, QNA_VIEW, QNA_CHECK
--                            ( 질문게시판번호, 제목, 내용, 작성일, 조회수, 답변상태 )
-- QNA_REPLY     질문게시판댓글    QNA_NUM, QNA_RE_NUM, QNA_RE_CON, QNA_RE_DATE, QNA_RE_NAME
--                            ( 질문게시판번호, 댓글번호, 내용, 작성일, 작성자 )
-- NOTICE        공지사항        NOTICE_NUM, NOTICE_SUB, NOTICE_CON, NOTICE_DATE, NOTICE_VIEW
--                            ( 공지사항번호, 공지사항제목, 공지사항내용, 작성일, 조회수 )

-- MEMBER
insert into MEMBER values ('aa@naver.com', 'aa', 'yy', '010-1111-2222', 'Y', SYSDATE, 'Y', 'ROLE_USER');
insert into MEMBER values ('bb@naver.com', 'bb', 'yn', '010-1111-1234', 'Y', SYSDATE, 'N', 'ROLE_USER');
insert into MEMBER values ('cc@naver.com', 'cc', 'nn', '010-1111-3456', 'N', SYSDATE, 'N', 'ROLE_USER');
insert into MEMBER values ('dd@naver.com', 'dd', 'ny', '010-1111-4578', 'N', SYSDATE, 'Y', 'ROLE_USER');
insert into MEMBER values ('kosmo01@naver.com', '1234', '기적의피스타치오', '010-3445-2990', 'N', SYSDATE, 'Y', 'ROLE_USER');
insert into MEMBER values ('kosmo02@naver.com', 'asdf', '피자빵', '010-1233-7200', 'N', SYSDATE, 'Y', 'ROLE_USER');
insert into MEMBER values ('kongBean@gmail.com', 'pw1234', '다젖습니다아마존', '010-8977-3213', 'N', SYSDATE, 'Y', 'ROLE_USER'); --크리에이터
insert into MEMBER values ('naverWebtoon@naver.com', 'pw1234', '네이버웹툰', '010-9999-9999', 'N', SYSDATE, 'Y', 'ROLE_USER'); --크리에이터
insert into MEMBER values ('lwy22@daum.net', 'kkkk00', '인절미', '010-3232-4522', 'N', SYSDATE, 'N', 'ROLE_USER');
insert into MEMBER values ('mango987@daum.net', '9808', '라이더', '010-9878-9909', 'N', SYSDATE, 'N', 'ROLE_USER');
insert into MEMBER values ('oktt0422@gmail.com', '123456', '달려라고구마', '010-5566-3139', 'N', SYSDATE, 'N', 'ROLE_USER');
insert into MEMBER values ('coff_e44@gmail.com', '562jj', '츠키츠키', '010-4248-0091', 'N', SYSDATE, 'N', 'ROLE_USER');
--select * from MEMBER;


-- BLACKLIST
--select * from BLACKLIST;

-- ADDRESS
insert into ADDRESS values (SEQ_ADDR_NUM.nextval, 'aa@naver.com', '학원', '김나미', '010-2034-1432', 08505, '서울특별시 금천구 가산디지털2로 123(가산동)', '월드메르디앙 2차 413호');
insert into ADDRESS values (SEQ_ADDR_NUM.nextval, 'aa@naver.com', '우리집', '김나미', '010-2344-1672', 03489, '서울시 은평구 수색로 270', '201호');
insert into ADDRESS values (SEQ_ADDR_NUM.nextval, 'aa@naver.com', '회사', '김나미', '010-2344-1672', 13473, '경기 성남시 분당구 판교로 185', '3층');
insert into ADDRESS values (SEQ_ADDR_NUM.nextval, 'bb@naver.com', '우리집', '김김밥', '010-3879-2144', 03925, '서울 마포구 월드컵북로 402', 'KGIT센터 1층 광장 김밥천국 상암 본점');
insert into ADDRESS values (SEQ_ADDR_NUM.nextval, 'kosmo01@naver.com', '우리집', '박하나', '010-0922-3272', 03489, '서울시 은평구 수색로 270', '204호');
select * from ADDRESS;


-- CATEGORY
insert into CATEGORY values(SEQ_CATEGORY_NUM.nextval, '영화');
insert into CATEGORY values(SEQ_CATEGORY_NUM.nextval, '출판');
insert into CATEGORY values(SEQ_CATEGORY_NUM.nextval, '음악');
insert into CATEGORY values(SEQ_CATEGORY_NUM.nextval, '잡화');
insert into CATEGORY values(SEQ_CATEGORY_NUM.nextval, '뷰티');
select * from CATEGORY;

-- CREATOR
insert into CREATOR values (SEQ_CREATOR_NUM.nextval, 'aa@naver.com', 'Y', '010-2034-1432', 'Y', '코스모매니지먼트');
insert into CREATOR values (SEQ_CREATOR_NUM.nextval, 'bb@naver.com', 'N', '031-3021-5532', 'Y', '우나 UNAH');
insert into CREATOR values (SEQ_CREATOR_NUM.nextval, 'bb@naver.com', 'Y', '031-3021-5532', 'Y', '(주)마인딩그룹');
insert into CREATOR values (SEQ_CREATOR_NUM.nextval, 'kosmo01@naver.com', 'Y', '02-4121-5758', 'Y', '뮤직파라소');
insert into CREATOR values (SEQ_CREATOR_NUM.nextval, 'kongBean@gmail.com', 'Y', '02-8988-7876', 'Y', '시나공');
insert into CREATOR values (SEQ_CREATOR_NUM.nextval, 'kongBean@gmail.com', 'Y', '031-9990-0973', 'Y', '네이버');
select * from CREATOR;


-- PROJECT
--영화
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 1, 1, '<천관사복> 우리말 더빙 한정판 DVD 패키지', 25000000, 
	'천관사복 백무금기! 팬분들께 가장 뜻깊은 선물을 드리고자 많은 준비 끝에 여기까지 왔습니다. 다만 여건상 제약으로 인해 패키지, DVD 케이스 그리고 DVD 양산을 위한 최소 제작 수량을 설정하였습니다. 항상 큰 힘이 되어 주시는 팬분들, 저희가 이 아름다운 프로젝트를 시작으로 다양한 공덕 수집 활동을 오래오래 이어 나갈 수 있도록 다시 한 번 많은 성원 부탁드립니다! ',
	'dvd1.jpg', 1515000, '22/04/01', '22/06/01', SYSDATE, SYSDATE, '펀딩중', 'aa@naver.com', 'thum_dvd1.jpg');

insert into PROJECT values (SEQ_PROJ_NUM.nextval, 3, 1, '[달빛천사] 스페셜 DVD 풀패키지', 200000000, 
	'"어린 시절의 소중한 추억을 소장" [달빛천사] 스페셜 DVD 풀패키지 !! 그 시절의 추억을 소환해낼 ‘달빛천사 스페셜 DVD 풀패키지’ 추억이 방울방울 첫 소환 대상은 루나와 대파라면 타토, 멜로니의 달빛천사!',
	'dvd2.jpg', 148026000, '22/04/15', '22/06/30', SYSDATE, SYSDATE, '펀딩중', 'aa@naver.com', 'thum_dvd2.jpg');

insert into PROJECT values (SEQ_PROJ_NUM.nextval, 2, 1, '전설의 로보트, 태양의 사자 철인28호 1기(DVD,BD)', 35000000, 
	'태양의 사자 철인28호는 DVD와 Blu-ray 형태로 1기, 2기로 나눠지며, 이번 텀블벅 프로젝트에서는 1기만 진행됩니다. 철인28호 1기 프로젝트 펀딩에 따라 2기의 출시가 결정됩니다. ',
	'dvd3.jpg', 13427400, '22/03/15', '22/07/31', SYSDATE, SYSDATE, '펀딩중', 'aa@naver.com', 'thum_dvd3.jpg');

insert into PROJECT values (SEQ_PROJ_NUM.nextval, 1, 1, '[해변의 에트랑제] 한국판 스페셜 DVD 패키지 한정판', 60000000, 
	'<해변의 에트랑제>는 한국에서는 만나기 힘든 수작 BL 애니메이션으로 <지저귀는 새는 날지 않는다>, <기븐>에 이은 후지 TV의 BL 테마 신규 레이블인 BLUE LYNX(블루 링크스)의 세 번째 프로젝트이며 엘론에게는 무수한 폐인을 양산해 낸 <지저귀는 새는 날지않는다>에 이은 두번째 작품입니다.',
	'dvd4.jpg', 575600, '22/03/31', '22/04/30', SYSDATE, SYSDATE, '펀딩중', 'aa@naver.com', 'thum_dvd4.jpg');

insert into PROJECT values (SEQ_PROJ_NUM.nextval, 3, 1, '떳다 그녀!! 여섯번째 에피소드와 DVD 제작', 5000000, 
	'"떳다 그녀!!"(영제:There She Is!!)는 애니메이션 시리즈입니다.  albinoblacksheep.com을 시작으로 플래시 애니메이션을 즐기는 전세계의 팬들에게 큰 화제가 되었습니다. 누적 감상수 천오백만 이상. Anima Mundi Web 2004, Ursa Major Award 2005,2008에서 상을 받았고, newgrounds.com에서는 12년 넘게 무비  순위 1위에 올라있는 뮤직비디오형식의 애니메이션입니다. ',
	'dvd5.jpg', 1207000, '22/04/17', '22/06/30', SYSDATE, SYSDATE, '펀딩중', 'aa@naver.com', 'thum_dvd5.jpg');

insert into PROJECT values (SEQ_PROJ_NUM.nextval, 2, 1, '사랑에 흔들리는 두 소녀의 이야기: <그 여름> 애니메이션', 5500000, 
	'열여덟 살의 두 소녀가 예기치 않게 찾아온 사랑이라는 감정에 흔들리는 한때의 여름. 그들이 겪는 일상의 작은 균열들을, 맑고 투명한 수채화 같은 풍경들을 하나의 애니메이션으로 담아내고자 합니다.',
	'dvd6.jpg', 1415000, '22/04/20', '22/07/19', SYSDATE, SYSDATE, '펀딩중', 'aa@naver.com', 'thum_dvd6.jpg');

insert into PROJECT values (SEQ_PROJ_NUM.nextval, 4, 1, '이번 여름, 일본 애니메이션과 함께 더위를 날려버리세요!', 8000000, 
	'진행 중인 특촬물, 메탈물 외에도 어린아이부터 어른들까지 누구나 즐길 수 있는 일본 만화 시리즈 DVD 프로젝트를 기획했습니다. 움직이기만 해도 땀이 나는 더운 여름에 에어컨과 시원한 음료와 함께 일본 만화 섭렵은 어떤가요?',
	'dvd7.jpg', 1147122591, '22/03/10', '22/05/02', SYSDATE, SYSDATE, '펀딩중', 'aa@naver.com', 'thum_dvd7.jpg');
--출판 (8~11)
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 5, 2, '마블의 모든 것! <마블 백과사전 개정판 2019>', 30000000, '2019년 최신 버전으로 돌아온 <마블 백과사전 개정판>을 만나보세요 :D','stroy_book_1.png' , 37423000, '19/09/02', '19/09/30', '19/09/01', '19/09/27', '펀딩완료', 'kongBean@gmail.com', 'thumb_book_1.jpg');
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 5, 2, '왓치맨과 DC 유니버스의 만남! <둠스데이 클락>',2000000, '왓치맨과 DC유니버스의 만남! <왓치맨>의 명성을 잇는 <둠스데이 클락>을 소개합니다.','stroy_book_2.png' , 20465300, '22/04/22', '22/05/11', '22/04/10', SYSDATE, '펀딩중', 'kongBean@gmail.com', 'thumb_book_2.jpg');
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 5, 2, '드디어 완결! 웹툰 <롤랑롤랑> 단행본 4-5권 제작', 10000000, '웹툰 <롤랑롤랑> 단행본을 완결까지 제작합니다.','stroy_book_3.png' ,26006000, '20/03/15', '20/03/27', '20/03/09', '20/03/30', '펀딩완료', 'kongBean@gmail.com', 'thumb_book_3.jpg');
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 5, 2, '네이버웹툰 <좀비딸> 단행본 전권 제작',1000000, 'EBS 애니메이션으로 재탄생한 화제의 인기 웹툰 <좀비딸>을 단행본으로 만나보세요..','stroy_book_4.png', 33939350, '22/04/15', '22/05/11', '22/04/01', SYSDATE, '펀딩중', 'kongBean@gmail.com','thumb_book_4.jpg' );

-- 음악 (12~16)
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 4, 3, '메이플스토리 OST : Black Heaven', 14500000, 
	'<메이플스토리 OST : Black Heaven 2018> 메이플스토리 첫 번째 블록버스터 "블랙헤븐", 그 감동의 시작! 스토리, 연출, OST까지 가장 많은 유저들이 사랑한 가슴 뭉클한 대서사시!  "Promise of Heaven"이 세련된 시크함으로 다시 태어나다!',
	'mapleOST_2.png', 29162200, '22/04/22', '22/06/01', SYSDATE, SYSDATE, '펀딩중', 'kosmo01@naver.com', 'mapleOST_1.jpg');
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 4, 3, '애니메이션 <요리왕 비룡> 한국판 주제가 앨범 정식 발매', 35000000, 
	'"애니메이션"이라는 말보다는 "만화영화"라는 말이 더 익숙했던 때. 마파두부가 어떤 요리인지 가르쳐주고, 엄마에게 황금볶음밥을 만들어 달라고 조르게 했던, <요리왕 비룡>이 그때 그 주제가로 돌아왔습니다.',
	'kingOST_2.png', 148026000, '22/04/15', '22/06/30', SYSDATE, SYSDATE, '펀딩중', 'kosmo01@naver.com', 'kingOST_1.png');
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 3, 3, '디지몬 어드벤처 - 버터플라이, 브레이브하트 앨범 발매', 35000000, 
	'구독자가 뽑은 유튜브 최고의 애니메이션 주제곡, 부동의 Best 1위! 투니버스 노동요 1위! 이제는 어른이 된 "어른이"들에게 또 한 번의 "선물 · 추억 · 위로 · 응원"이 되길 바랍니다.',
	'Butter-fly_2.png', 1342749000, '22/04/05', '22/05/12', SYSDATE, SYSDATE, '펀딩중', 'kosmo01@naver.com', 'Butter-fly_1.png');
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 1, 3, '달빛천사15주년기념 국내정식OST발매', 3000000, 
	'루나(풀문) 성우 이용신의 달빛천사 국내정식OST 발매 가제: 풀문, 15년 후 이야기 달빛천사에 삽입되었던 일본원곡을 정식으로 리메이크해 2019년 새로운 달빛천사OST를 선보이고자 합니다. 어린시절 TV앞에서 달빛천사에 울고웃던 달천세대(90년대생)에게 추억을 일깨워주는 아름다운 선물이 될 것입니다.',
	'fullMoonOST_2.png', 2636684000, '19/09/25', '19/11/30', SYSDATE, SYSDATE, '펀딩완료', 'kosmo01@naver.com', 'fullMoonOST_1.png');
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 3, 3, '이누야샤 OST 앨범 재발매 프로젝트', 100000000, 
	'신성한 나무에서 시작된 모험, 사혼의 구슬을 둘러싼 싸움! 시공을 초월한 모험, 이누야샤! “다들 많이 기다렸지? 그럼, 이누야샤님의 이야기를 시작해볼까?” 그 때 그 시절의 음질과 구성의 아쉬움을 모두 담아, 어릴 적 추억으로 머물 수밖에 없었던 그 소중한 노래들을 2022년, 그대로 선보입니다.',
	'inuyashaOST_2.png', 1147122591, '22/03/10', '22/05/02', SYSDATE, SYSDATE, '펀딩중', 'kosmo01@naver.com', 'inuyashaOST_1.png');

-- 뷰티 (17~19)
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 5, 4, '잔망루피 콜라보 팔레트', 300000, 
	'아... 기력없다... 삐덕들의 기력 보충을 위해 삐아와 잔망 루피가 뭉쳤다!! 군침이 싹~ 도네~!!',
	'bbia.jpg', 280500, '22/03/18', '22/05/06', SYSDATE, SYSDATE, '펀딩중', 'bb@naver.com', 'bbiabest.png');

insert into PROJECT values (SEQ_PROJ_NUM.nextval, 5, 4, '코카콜라 스프라이트 콜라보 립케어 립밤', 250000, 
	'세상에서 가장 짜릿한- 콜라보! 톡!톡! 튀는 취향 저격 립밤',
	'coke.jpg', 251000, '22/03/01', '22/03/28', SYSDATE, SYSDATE, '펀딩완료', 'bb@naver.com', 'cokebest.png');

insert into PROJECT values (SEQ_PROJ_NUM.nextval, 5, 4, '[아기곰 푸우] 푸우의 꿀단지에서는 어떤 향기가 날까?', 500000, 
	'직접 향기를 상상할 수 있는 소재로 준비한 향수',
	'pooh.jpg', 5941000, '22/02/15', '22/05/05', SYSDATE, SYSDATE, '펀딩중', 'bb@naver.com', 'poohbest.png');


-- 잡화

--select * from PROJECT;
--||chr(10)||chr(13||



-- REWARD
-- 영화
insert into REWARD values (SEQ_REWARD_NUM.nextval, 1, '선물없이 후원하기', 1000, 100000, '22/07/01');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 1, '보제관 세트 (기본)', 122888, 2000, '22/07/01');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 1, '천관사복 아크릴 스탠드를 이미 보유하고 계신 후원자님을 위한 기본 세트', 100888, 1000, '22/04/30');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 2, '선물없이 후원하기', 5000, 100000, '22/06/02');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 2, '달빛천사 스페셜 DVD 풀패키지 (배송비 포함)', 129000, 2000, '22/08/31');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 2, '달빛천사 스페셜 DVD 풀패키지 2개 (배송비 포함)', 250000, 3000, '22/08/31');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 3, '선물없이 후원하기', 5000, 100000, '22/08/16');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 3, '[얼리버드] 옵션 7. 철인28호 DVD Vol.1 (우리말더빙)', 66000, 500, '22/07/16');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 3, '철인28호 Vol.1 블루레이 세트', 132000, 2500, '22/08/16');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 4, '선물없이 후원하기', 1000, 100000, '22/09/14');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 4, '내 심장 뿌셔뿌셔(세트A)', 54000, 1500, '22/09/14');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 4, '나에게 찾아온 첫사랑(세트B)', 82000, 2500, '22/09/14');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 5, '선물없이 후원하기', 5000, 100000, '22/07/01');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 5, '온라인초대권 SET', 60000, 150, '22/08/22');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 5, '기념뱃지 SET', 80000, 300, '22/08/22');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 6, '선물없이 후원하기', 1000, 100000, '22/07/20');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 6, '오직 <그 여름> USB 패키지', 35000, 150, '22/09/17');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 6, '내년에도 <그 여름> 달력 패키지', 50000, 300, '22/09/17');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 7, '선물없이 후원하기', 1000, 100000, '22/05/03');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 7, '<"달려라! 부메랑"> 배송비 포함', 49900, 2000, '22/06/30');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 7, '<허클베리핀의 모험 + 엄지공주> 한정수량, 배송비 포함', 59900, 2500, '22/06/30');
-- 출판
--마블리워드
insert into REWARD values (SEQ_REWARD_NUM.nextval, 8, '텀블벅한정판매 백과사전', 47000, 1000, '19/10/22');
--왓치맨리워드
insert into REWARD values (SEQ_REWARD_NUM.nextval, 9, '둠스데이클락 1권', 33300, 1000, '22/05/25');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 9, '둠스데이클락 1권+한정포스터', 39500, 500, '22/05/25');
--롤랑롤랑리워드
insert into REWARD values (SEQ_REWARD_NUM.nextval, 10, 'setA', 37500, 330, '20/04/12');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 10, 'setB', 72400, 195, '20/04/12');
--좀비딸 리워드
insert into REWARD values (SEQ_REWARD_NUM.nextval, 11, '단행본 전권+마스킹테이프', 89850, 380, '22/05/30');

-- 음악
insert into REWARD values (SEQ_REWARD_NUM.nextval, 12, '메이플스토리 OST : Black Heaven (1개)', 55850, 400, '22/06/30');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 12, '오르카의 토끼사랑 의자 1개(영구) 교환 쿠폰 (1개)', 48000, 800, '22/06/30');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 13, '환상의 마파두부 팝업 패키지', 45500, 200, '22/07/01');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 13, '화룡이 봉인된 숟가락 세트', 75000, 200, '22/07/01');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 13, '황제에게 보내는 전설의 식기세트 + 넘버링 사인 카드', 89500, 100, '22/07/01');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 14, 'CD 앨범 패키지', 55000, 500, '22/05/28');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 15, '달빛천사 구성(33,000원)', 33000, 800, '22/12/31');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 15, 'USB형 앨범 구성(55,000원)', 55000, 600, '22/12/31');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 16, '4.4패키지', 55000, 700, '22/06/14');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 16, '7.7패키지 3D렌티큘러 2종 세트', 77000, 700, '22/06/14');

-- 뷰티
insert into REWARD values (SEQ_REWARD_NUM.nextval, 17, '라스트 벨벳 립 틴트 잔망 루피 에디션', 25500, 50, '22/05/06');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 17, '라스트 벨벳 립 틴트 키링 기획 잔망 루피 에디션', 25000, 50, '22/05/06');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 17, '파이널 섀도우 팔레트5', 25000, 50, '22/05/06');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 17, '커스텀 손거울 스티커 기획 잔망 루피 에디션', 25000, 50, '22/05/06');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 18, '스프라이트', 1000, 500, '22/03/28');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 18, '코카콜라', 1000, 500, '22/03/28');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 19, '[위니더푸]허니듀 오 드 퍼퓸 30mL', 36000, 500, '22/05/05');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 19, '[위니더푸]허니듀 오 드 퍼퓸 30mL(x2)', 72000, 500, '22/05/05');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 19, '[위니더푸]허니듀 오 드 퍼퓸 30mL + 지난 프로젝트 작품 골라담기', 72000, 500, '22/05/05');
--잡화
--select * from REWARD;



-- MEM_ORDER
insert into MEM_ORDER values (SEQ_MORDER_NUM.nextval, 5, 7, 'kosmo01@naver.com', '박하나', 15000, SYSDATE, '결제예약', '상토로 바꿔주세요', '선물준비');
insert into MEM_ORDER values (SEQ_MORDER_NUM.nextval, 2, 6, 'aa@naver.com', '김나미', 35000, SYSDATE, '결제예약', null, '선물준비');
insert into MEM_ORDER values (SEQ_MORDER_NUM.nextval, 2, 5, 'aa@naver.com', '김나미', 37000, SYSDATE, '결제예약', null, '선물준비');
--select * from MEM_ORDER;



-- COMMUNITY
insert into COMMUNITY values (SEQ_COMMUNITY_NUM.nextval, 1, 'aa@naver.com', '프로젝트 공지', '프로젝트 공지 내용', SYSDATE, SYSDATE, 0);
insert into COMMUNITY values (SEQ_COMMUNITY_NUM.nextval, 2, 'bb@naver.com', '[오픈이벤트]참여하세요', '3월 27일 (일) PM11:59까지 펀딩하면 추첨을 통해 10만원 상당 식물 및 화분을 드립니다!', SYSDATE, SYSDATE, 26);
insert into COMMUNITY values (SEQ_COMMUNITY_NUM.nextval, 2, 'bb@naver.com', '[72시간 EVENT]', '펀딩시작후 72시간 내에 펀딩하면 추첨을 통해 LED식물조명을 드립니다..', SYSDATE, SYSDATE, 15);
insert into COMMUNITY values (SEQ_COMMUNITY_NUM.nextval, 2, 'bb@naver.com', '오픈 예정 TOP20 감사합니다', '관심 가져주신 서포터 여러분께 감사드립니다!', SYSDATE, SYSDATE, 21);
--select * from COMMUNITY;


-- NOTICE
insert into NOTICE values (SEQ_NOTICE_NUM.nextval, '후원을 했는데 후원목록이 안 나와요', '후원하신 계정이 아닌 다른 계정으로 로그인하셨을 수 있습니다. 로그인 계쩡을 확인해주세요!', SYSDATE, 712);
insert into NOTICE values (SEQ_NOTICE_NUM.nextval, '여러 개의 리워드를 후원하고 싶어요', '한 프로젝트당 한 개의 선물만 선택하여 후원할 수 있습니다. 다만 창작자에게 문의 후 창작자가 이를 반영하여 리워드를 전할 수 있습니다.', SYSDATE, 32);
insert into NOTICE values (SEQ_NOTICE_NUM.nextval, '선물 전달일이 지났는데 배송이 안 와요', '창작자가 프로젝트 페이지 내 "커뮤니티"에 변동사항에 대한 업데이트를 올렸는지 먼저 확인해주세요.', SYSDATE, 32);
insert into NOTICE values (SEQ_NOTICE_NUM.nextval, '사업자 없는 개인도 펀딩할 수 있나요?', '펀캣은 사업자/개인 여부에 관계없이 프로젝트 진행이 가능합니다. 최소 자격 요건을 확인해주세요!', SYSDATE, 95);
insert into NOTICE values (SEQ_NOTICE_NUM.nextval, '선물 전달이 지연될 것 같아요', '배송 일정의 지연으로 예상 전달일보다 발송이 늦어진다면, 후원자께서 안심하고 기다리실 수 있도록 커뮤니티에 배송 지연에 대한 공지를 게시해주세요.', SYSDATE, 34);
--select * from NOTICE;

commit;



