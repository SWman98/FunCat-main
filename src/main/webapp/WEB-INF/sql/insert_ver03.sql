/* ���� ����*/
--sqlplus / as sysdba
--alter session set "_oracle_script"=true;
--create user team4 identified by java;
--grant connect, resource, unlimited tablespace to team4;
--conn team4/java;
--select * from tab;

-- ���̺�       ( �� �𵨸� )      ( Į�� )

-- MEMBER        ȸ��	      MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_PHONE, MEMBER_EMAIL_CHECK, MEMBER_RDATE, MEMBER_CHECK 
--                            ( ȸ�����̵�, ȸ����й�ȣ, ȸ����, ��ȭ��ȣ, �̸��ϼ��ſ���, ȸ��������, ũ�������Ϳ��� )
-- BLACKLIST     ������Ʈ      BLACKLIST_NUM, MEMBER_ID, BLACKLIST_STOP, BLACKLIST_DATE, BLACKLIST_CNT
--                            ( ������Ʈ��ȣ, ȸ�����̵�, Ȱ����������, Ȱ��������, �����Ű�� )
-- ADDRESS       ���������       ADDR_NUM, MEMBER_ID, ADDR_NAME, ADDR_RECIVER, ADDR_PHONE, ADDR_POST, ADDR_ROADNAME, ADDR_DETAIL
--                            ( �������ȣ, ȸ�����̵�, �������, �޴���, �޴��̹�ȣ, �����ȣ, ���θ��ּ�, ���ּ�)
-- CATEGORY      ī�װ�        CATEGORY_NUM, CATEGORY_SUB
--                            ( ī�װ���ȣ, ī�װ��� )
-- CREATOR       ũ��������       CREATOR_NUM, CREATOR_TYPE, CREATOR_PHONE, CREATOR_CHECK, CREATOR_NAME
--                            ( ũ�������͹�ȣ, ����ڱ���, ũ����������ȭ��ȣ, ���������������ǿ���, ũ���������̸�)
-- PROJECT       ������Ʈ        PROJECT_NUM, CREATOR_NUM, CATEGORY_NUM, PROJECT_SUB, PROJECT_GOAL, PROJECT_COMMENT, PROJECT_DETAIL, PROJECT_PRICE, PROJECT_OPEN, PROJECT_CLOSE, PROJECT_DATE, PROJECT_MDATE, PROJECT_LEVEL
--                            ( ������Ʈ��ȣ, ũ�������͹�ȣ, ī�װ���ȣ, ������Ʈ����, ��ǥ�ݾ�, ���, ���丮, �Ŀ��ݾ�, ������Ʈ������, ������Ʈ������, �ۼ���, ������, ������Ʈ�ܰ� )
-- REWARD        ������         REWARD_NUM, PROJECT_NUM, REWARD_SUB, REWARD_PRICE, REWARD_CNT, REWARD_DATE
--                            ( �������ȣ, ������Ʈ��ȣ, �������, �ݾ�, ���Ѽ���, �߼۽�����)
-- ORDER         �ֹ�	      ORDER_NUM, ADDR_NUM, REWARD_NUM, MEMBER_ID, ORDER_NAME, ORDER_PRICE, ORDER_DATE, ORDER_STATEMENT, ORDER_OPTION, ORDER_DELIVERY
--                            ( �ֹ���ȣ, �������ȣ, �������ȣ, ȸ�����̵�, �ֹ���, �ֹ��ݾ�, �ֹ�����, �ֹ�����, �Է¿ɼǳ���, ��۴ܰ� )
-- PAYMENT       ����           PAYMENT_NUM, ADDR_NUM, ORDER_NUM, MEMBER_ID, PAYMENT_PAY, PAYMENT_PRICE, PAYMENT_DATE, PAYMENT_TIME
--                            ( ������ȣ, �������ȣ, �ֹ���ȣ, ȸ�����̵�, �������, �����ݾ�, ��������, �������νð� )
-- COMMUNITY     Ŀ�´�Ƽ        COMMUNITY_NUM, MEMBER_ID, COMMUNITY_SUB, COMMUNITY_CON, COMMUNITY_DATE, COMMUNITY_MDATE, COMMUNITY_VIEW
--                            ( Ŀ�´�Ƽ�۹�ȣ, ȸ�����̵�, Ŀ�´�Ƽ����, Ŀ�´�Ƽ����, Ŀ�´�Ƽ�����, Ŀ�´�Ƽ������, Ŀ�´�Ƽ��ȸ�� )
-- COMMUNITY_REPLY  Ŀ�´�Ƽ���   COM_RE_NUM, MEMBER_ID, COMMUNITY_NUM, COM_RE_CON, COM_RE_DATE, COM_RE_MDATE
--                            ( ��۹�ȣ, ȸ�����̵�, Ŀ�´�Ƽ�۹�ȣ, ��۳���, �ۼ���, ������ )
-- REPORT        �Ű�           REPORT_NUM, COM_RE_NUM, REPORT_REASON, REPORT_DATE, REPORT_CHECK
--                            ( �Ű��ȣ, ��۹�ȣ, �Ű����, �Ű���, �Ű�ó������ )
-- QNA           �����Խ���       QNA_NUM, QNA_SUB, QNA_CON, QNA_DATE, QNA_VIEW, QNA_CHECK
--                            ( �����Խ��ǹ�ȣ, ����, ����, �ۼ���, ��ȸ��, �亯���� )
-- QNA_REPLY     �����Խ��Ǵ��    QNA_NUM, QNA_RE_NUM, QNA_RE_CON, QNA_RE_DATE, QNA_RE_NAME
--                            ( �����Խ��ǹ�ȣ, ��۹�ȣ, ����, �ۼ���, �ۼ��� )
-- NOTICE        ��������        NOTICE_NUM, NOTICE_SUB, NOTICE_CON, NOTICE_DATE, NOTICE_VIEW
--                            ( �������׹�ȣ, ������������, �������׳���, �ۼ���, ��ȸ�� )

-- MEMBER
insert into MEMBER values ('aa@naver.com', 'aa', 'yy', '010-1111-2222', 'Y', SYSDATE, 'Y', 'ROLE_USER');
insert into MEMBER values ('bb@naver.com', 'bb', 'yn', '010-1111-1234', 'Y', SYSDATE, 'N', 'ROLE_USER');
insert into MEMBER values ('cc@naver.com', 'cc', 'nn', '010-1111-3456', 'N', SYSDATE, 'N', 'ROLE_USER');
insert into MEMBER values ('dd@naver.com', 'dd', 'ny', '010-1111-4578', 'N', SYSDATE, 'Y', 'ROLE_USER');
insert into MEMBER values ('kosmo01@naver.com', '1234', '�������ǽ�Ÿġ��', '010-3445-2990', 'N', SYSDATE, 'Y', 'ROLE_USER');
insert into MEMBER values ('kosmo02@naver.com', 'asdf', '���ڻ�', '010-1233-7200', 'N', SYSDATE, 'Y', 'ROLE_USER');
insert into MEMBER values ('kongBean@gmail.com', 'pw1234', '�������ϴپƸ���', '010-8977-3213', 'N', SYSDATE, 'Y', 'ROLE_USER'); --ũ��������
insert into MEMBER values ('naverWebtoon@naver.com', 'pw1234', '���̹�����', '010-9999-9999', 'N', SYSDATE, 'Y', 'ROLE_USER'); --ũ��������
insert into MEMBER values ('lwy22@daum.net', 'kkkk00', '������', '010-3232-4522', 'N', SYSDATE, 'N', 'ROLE_USER');
insert into MEMBER values ('mango987@daum.net', '9808', '���̴�', '010-9878-9909', 'N', SYSDATE, 'N', 'ROLE_USER');
insert into MEMBER values ('oktt0422@gmail.com', '123456', '�޷������', '010-5566-3139', 'N', SYSDATE, 'N', 'ROLE_USER');
insert into MEMBER values ('coff_e44@gmail.com', '562jj', '��Ű��Ű', '010-4248-0091', 'N', SYSDATE, 'N', 'ROLE_USER');
--select * from MEMBER;


-- BLACKLIST
--select * from BLACKLIST;

-- ADDRESS
insert into ADDRESS values (SEQ_ADDR_NUM.nextval, 'aa@naver.com', '�п�', '�質��', '010-2034-1432', 08505, '����Ư���� ��õ�� ���������2�� 123(���굿)', '����޸���� 2�� 413ȣ');
insert into ADDRESS values (SEQ_ADDR_NUM.nextval, 'aa@naver.com', '�츮��', '�質��', '010-2344-1672', 03489, '����� ���� ������ 270', '201ȣ');
insert into ADDRESS values (SEQ_ADDR_NUM.nextval, 'aa@naver.com', 'ȸ��', '�質��', '010-2344-1672', 13473, '��� ������ �д籸 �Ǳ��� 185', '3��');
insert into ADDRESS values (SEQ_ADDR_NUM.nextval, 'bb@naver.com', '�츮��', '����', '010-3879-2144', 03925, '���� ������ �����źϷ� 402', 'KGIT���� 1�� ���� ���õ�� ��� ����');
insert into ADDRESS values (SEQ_ADDR_NUM.nextval, 'kosmo01@naver.com', '�츮��', '���ϳ�', '010-0922-3272', 03489, '����� ���� ������ 270', '204ȣ');
select * from ADDRESS;


-- CATEGORY
insert into CATEGORY values(SEQ_CATEGORY_NUM.nextval, '��ȭ');
insert into CATEGORY values(SEQ_CATEGORY_NUM.nextval, '����');
insert into CATEGORY values(SEQ_CATEGORY_NUM.nextval, '����');
insert into CATEGORY values(SEQ_CATEGORY_NUM.nextval, '��ȭ');
insert into CATEGORY values(SEQ_CATEGORY_NUM.nextval, '��Ƽ');
select * from CATEGORY;

-- CREATOR
insert into CREATOR values (SEQ_CREATOR_NUM.nextval, 'aa@naver.com', 'Y', '010-2034-1432', 'Y', '�ڽ���Ŵ�����Ʈ');
insert into CREATOR values (SEQ_CREATOR_NUM.nextval, 'bb@naver.com', 'N', '031-3021-5532', 'Y', '�쳪 UNAH');
insert into CREATOR values (SEQ_CREATOR_NUM.nextval, 'bb@naver.com', 'Y', '031-3021-5532', 'Y', '(��)���ε��׷�');
insert into CREATOR values (SEQ_CREATOR_NUM.nextval, 'kosmo01@naver.com', 'Y', '02-4121-5758', 'Y', '�����Ķ��');
insert into CREATOR values (SEQ_CREATOR_NUM.nextval, 'kongBean@gmail.com', 'Y', '02-8988-7876', 'Y', '�ó���');
insert into CREATOR values (SEQ_CREATOR_NUM.nextval, 'kongBean@gmail.com', 'Y', '031-9990-0973', 'Y', '���̹�');
select * from CREATOR;


-- PROJECT
--��ȭ
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 1, 1, '<õ���纹> �츮�� ���� ������ DVD ��Ű��', 25000000, 
	'õ���纹 �鹫�ݱ�! �Һе鲲 ���� ����� ������ �帮���� ���� �غ� ���� ������� �Խ��ϴ�. �ٸ� ���ǻ� �������� ���� ��Ű��, DVD ���̽� �׸��� DVD ����� ���� �ּ� ���� ������ �����Ͽ����ϴ�. �׻� ū ���� �Ǿ� �ֽô� �Һе�, ���� �� �Ƹ��ٿ� ������Ʈ�� �������� �پ��� ���� ���� Ȱ���� �������� �̾� ���� �� �ֵ��� �ٽ� �� �� ���� ���� ��Ź�帳�ϴ�! ',
	'dvd1.jpg', 1515000, '22/04/01', '22/06/01', SYSDATE, SYSDATE, '�ݵ���', 'aa@naver.com', 'thum_dvd1.jpg');

insert into PROJECT values (SEQ_PROJ_NUM.nextval, 3, 1, '[�޺�õ��] ����� DVD Ǯ��Ű��', 200000000, 
	'"� ������ ������ �߾��� ����" [�޺�õ��] ����� DVD Ǯ��Ű�� !! �� ������ �߾��� ��ȯ�س� ���޺�õ�� ����� DVD Ǯ��Ű���� �߾��� ����� ù ��ȯ ����� �糪�� ���Ķ�� Ÿ��, ��δ��� �޺�õ��!',
	'dvd2.jpg', 148026000, '22/04/15', '22/06/30', SYSDATE, SYSDATE, '�ݵ���', 'aa@naver.com', 'thum_dvd2.jpg');

insert into PROJECT values (SEQ_PROJ_NUM.nextval, 2, 1, '������ �κ�Ʈ, �¾��� ���� ö��28ȣ 1��(DVD,BD)', 35000000, 
	'�¾��� ���� ö��28ȣ�� DVD�� Blu-ray ���·� 1��, 2��� ��������, �̹� �Һ�� ������Ʈ������ 1�⸸ ����˴ϴ�. ö��28ȣ 1�� ������Ʈ �ݵ��� ���� 2���� ��ð� �����˴ϴ�. ',
	'dvd3.jpg', 13427400, '22/03/15', '22/07/31', SYSDATE, SYSDATE, '�ݵ���', 'aa@naver.com', 'thum_dvd3.jpg');

insert into PROJECT values (SEQ_PROJ_NUM.nextval, 1, 1, '[�غ��� ��Ʈ����] �ѱ��� ����� DVD ��Ű�� ������', 60000000, 
	'<�غ��� ��Ʈ����>�� �ѱ������� ������ ���� ���� BL �ִϸ��̼����� <�����ʹ� ���� ���� �ʴ´�>, <���>�� ���� ���� TV�� BL �׸� �ű� ���̺��� BLUE LYNX(��� ��ũ��)�� �� ��° ������Ʈ�̸� ���п��Դ� ������ ������ ����� �� <�����ʹ� ���� �����ʴ´�>�� ���� �ι�° ��ǰ�Դϴ�.',
	'dvd4.jpg', 575600, '22/03/31', '22/04/30', SYSDATE, SYSDATE, '�ݵ���', 'aa@naver.com', 'thum_dvd4.jpg');

insert into PROJECT values (SEQ_PROJ_NUM.nextval, 3, 1, '���� �׳�!! ������° ���Ǽҵ�� DVD ����', 5000000, 
	'"���� �׳�!!"(����:There She Is!!)�� �ִϸ��̼� �ø����Դϴ�.  albinoblacksheep.com�� �������� �÷��� �ִϸ��̼��� ���� �������� �ҵ鿡�� ū ȭ���� �Ǿ����ϴ�. ���� ����� õ���鸸 �̻�. Anima Mundi Web 2004, Ursa Major Award 2005,2008���� ���� �޾Ұ�, newgrounds.com������ 12�� �Ѱ� ����  ���� 1���� �ö��ִ� �������������� �ִϸ��̼��Դϴ�. ',
	'dvd5.jpg', 1207000, '22/04/17', '22/06/30', SYSDATE, SYSDATE, '�ݵ���', 'aa@naver.com', 'thum_dvd5.jpg');

insert into PROJECT values (SEQ_PROJ_NUM.nextval, 2, 1, '����� ��鸮�� �� �ҳ��� �̾߱�: <�� ����> �ִϸ��̼�', 5500000, 
	'������ ���� �� �ҳడ ����ġ �ʰ� ã�ƿ� ����̶�� ������ ��鸮�� �Ѷ��� ����. �׵��� �޴� �ϻ��� ���� �տ�����, ���� ������ ��äȭ ���� ǳ����� �ϳ��� �ִϸ��̼����� ��Ƴ����� �մϴ�.',
	'dvd6.jpg', 1415000, '22/04/20', '22/07/19', SYSDATE, SYSDATE, '�ݵ���', 'aa@naver.com', 'thum_dvd6.jpg');

insert into PROJECT values (SEQ_PROJ_NUM.nextval, 4, 1, '�̹� ����, �Ϻ� �ִϸ��̼ǰ� �Բ� ������ ������������!', 8000000, 
	'���� ���� Ư�Թ�, ��Ż�� �ܿ��� ����̺��� ������ ������ ��� �� �ִ� �Ϻ� ��ȭ �ø��� DVD ������Ʈ�� ��ȹ�߽��ϴ�. �����̱⸸ �ص� ���� ���� ���� ������ �������� �ÿ��� ����� �Բ� �Ϻ� ��ȭ ������ �����?',
	'dvd7.jpg', 1147122591, '22/03/10', '22/05/02', SYSDATE, SYSDATE, '�ݵ���', 'aa@naver.com', 'thum_dvd7.jpg');
--���� (8~11)
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 5, 2, '������ ��� ��! <���� ������� ������ 2019>', 30000000, '2019�� �ֽ� �������� ���ƿ� <���� ������� ������>�� ���������� :D','stroy_book_1.png' , 37423000, '19/09/02', '19/09/30', '19/09/01', '19/09/27', '�ݵ��Ϸ�', 'kongBean@gmail.com', 'thumb_book_1.jpg');
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 5, 2, '��ġ�ǰ� DC ���Ϲ����� ����! <�ҽ����� Ŭ��>',2000000, '��ġ�ǰ� DC���Ϲ����� ����! <��ġ��>�� ���� �մ� <�ҽ����� Ŭ��>�� �Ұ��մϴ�.','stroy_book_2.png' , 20465300, '22/04/22', '22/05/11', '22/04/10', SYSDATE, '�ݵ���', 'kongBean@gmail.com', 'thumb_book_2.jpg');
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 5, 2, '���� �ϰ�! ���� <�Ѷ��Ѷ�> ���ົ 4-5�� ����', 10000000, '���� <�Ѷ��Ѷ�> ���ົ�� �ϰ���� �����մϴ�.','stroy_book_3.png' ,26006000, '20/03/15', '20/03/27', '20/03/09', '20/03/30', '�ݵ��Ϸ�', 'kongBean@gmail.com', 'thumb_book_3.jpg');
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 5, 2, '���̹����� <�����> ���ົ ���� ����',1000000, 'EBS �ִϸ��̼����� ��ź���� ȭ���� �α� ���� <�����>�� ���ົ���� ����������..','stroy_book_4.png', 33939350, '22/04/15', '22/05/11', '22/04/01', SYSDATE, '�ݵ���', 'kongBean@gmail.com','thumb_book_4.jpg' );

-- ���� (12~16)
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 4, 3, '�����ý��丮 OST : Black Heaven', 14500000, 
	'<�����ý��丮 OST : Black Heaven 2018> �����ý��丮 ù ��° ��Ϲ����� "�����", �� ������ ����! ���丮, ����, OST���� ���� ���� �������� ����� ���� ��Ŭ�� �뼭���!  "Promise of Heaven"�� ���õ� ��ũ������ �ٽ� �¾��!',
	'mapleOST_2.png', 29162200, '22/04/22', '22/06/01', SYSDATE, SYSDATE, '�ݵ���', 'kosmo01@naver.com', 'mapleOST_1.jpg');
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 4, 3, '�ִϸ��̼� <�丮�� ���> �ѱ��� ������ �ٹ� ���� �߸�', 35000000, 
	'"�ִϸ��̼�"�̶�� �����ٴ� "��ȭ��ȭ"��� ���� �� �ͼ��ߴ� ��. ���ĵκΰ� � �丮���� �������ְ�, �������� Ȳ�ݺ������� ����� �޶�� ������ �ߴ�, <�丮�� ���>�� �׶� �� �������� ���ƿԽ��ϴ�.',
	'kingOST_2.png', 148026000, '22/04/15', '22/06/30', SYSDATE, SYSDATE, '�ݵ���', 'kosmo01@naver.com', 'kingOST_1.png');
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 3, 3, '������ ��庥ó - �����ö���, �극�̺���Ʈ �ٹ� �߸�', 35000000, 
	'�����ڰ� ���� ��Ʃ�� �ְ��� �ִϸ��̼� ������, �ε��� Best 1��! ���Ϲ��� �뵿�� 1��! ������ ��� �� "���"�鿡�� �� �� ���� "���� �� �߾� �� ���� �� ����"�� �Ǳ� �ٶ��ϴ�.',
	'Butter-fly_2.png', 1342749000, '22/04/05', '22/05/12', SYSDATE, SYSDATE, '�ݵ���', 'kosmo01@naver.com', 'Butter-fly_1.png');
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 1, 3, '�޺�õ��15�ֳ��� ��������OST�߸�', 3000000, 
	'�糪(Ǯ��) ���� �̿���� �޺�õ�� ��������OST �߸� ����: Ǯ��, 15�� �� �̾߱� �޺�õ�翡 ���ԵǾ��� �Ϻ������� �������� ������ũ�� 2019�� ���ο� �޺�õ��OST�� �����̰��� �մϴ�. ����� TV�տ��� �޺�õ�翡 ������ ��õ����(90����)���� �߾��� �ϱ����ִ� �Ƹ��ٿ� ������ �� ���Դϴ�.',
	'fullMoonOST_2.png', 2636684000, '19/09/25', '19/11/30', SYSDATE, SYSDATE, '�ݵ��Ϸ�', 'kosmo01@naver.com', 'fullMoonOST_1.png');
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 3, 3, '�̴��߻� OST �ٹ� ��߸� ������Ʈ', 100000000, 
	'�ż��� �������� ���۵� ����, ��ȥ�� ������ �ѷ��� �ο�! �ð��� �ʿ��� ����, �̴��߻�! ���ٵ� ���� ��ٷ���? �׷�, �̴��߻����� �̾߱⸦ �����غ���?�� �� �� �� ������ ������ ������ �ƽ����� ��� ���, � �� �߾����� �ӹ� ���ۿ� ������ �� ������ �뷡���� 2022��, �״�� �����Դϴ�.',
	'inuyashaOST_2.png', 1147122591, '22/03/10', '22/05/02', SYSDATE, SYSDATE, '�ݵ���', 'kosmo01@naver.com', 'inuyashaOST_1.png');

-- ��Ƽ (17~19)
insert into PROJECT values (SEQ_PROJ_NUM.nextval, 5, 4, '�ܸ����� �ݶ� �ȷ�Ʈ', 300000, 
	'��... ��¾���... �ߴ����� ��� ������ ���� �߾ƿ� �ܸ� ���ǰ� ���ƴ�!! ��ħ�� ��~ ����~!!',
	'bbia.jpg', 280500, '22/03/18', '22/05/06', SYSDATE, SYSDATE, '�ݵ���', 'bb@naver.com', 'bbiabest.png');

insert into PROJECT values (SEQ_PROJ_NUM.nextval, 5, 4, '��ī�ݶ� ��������Ʈ �ݶ� ���ɾ� ����', 250000, 
	'���󿡼� ���� ¥����- �ݶ�! ��!��! Ƣ�� ���� ���� ����',
	'coke.jpg', 251000, '22/03/01', '22/03/28', SYSDATE, SYSDATE, '�ݵ��Ϸ�', 'bb@naver.com', 'cokebest.png');

insert into PROJECT values (SEQ_PROJ_NUM.nextval, 5, 4, '[�Ʊ�� Ǫ��] Ǫ���� �ܴ��������� � ��Ⱑ ����?', 500000, 
	'���� ��⸦ ����� �� �ִ� ����� �غ��� ���',
	'pooh.jpg', 5941000, '22/02/15', '22/05/05', SYSDATE, SYSDATE, '�ݵ���', 'bb@naver.com', 'poohbest.png');


-- ��ȭ

--select * from PROJECT;
--||chr(10)||chr(13||



-- REWARD
-- ��ȭ
insert into REWARD values (SEQ_REWARD_NUM.nextval, 1, '�������� �Ŀ��ϱ�', 1000, 100000, '22/07/01');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 1, '������ ��Ʈ (�⺻)', 122888, 2000, '22/07/01');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 1, 'õ���纹 ��ũ�� ���ĵ带 �̹� �����ϰ� ��� �Ŀ��ڴ��� ���� �⺻ ��Ʈ', 100888, 1000, '22/04/30');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 2, '�������� �Ŀ��ϱ�', 5000, 100000, '22/06/02');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 2, '�޺�õ�� ����� DVD Ǯ��Ű�� (��ۺ� ����)', 129000, 2000, '22/08/31');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 2, '�޺�õ�� ����� DVD Ǯ��Ű�� 2�� (��ۺ� ����)', 250000, 3000, '22/08/31');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 3, '�������� �Ŀ��ϱ�', 5000, 100000, '22/08/16');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 3, '[�󸮹���] �ɼ� 7. ö��28ȣ DVD Vol.1 (�츮������)', 66000, 500, '22/07/16');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 3, 'ö��28ȣ Vol.1 ��緹�� ��Ʈ', 132000, 2500, '22/08/16');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 4, '�������� �Ŀ��ϱ�', 1000, 100000, '22/09/14');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 4, '�� ���� �ѼŻѼ�(��ƮA)', 54000, 1500, '22/09/14');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 4, '������ ã�ƿ� ù���(��ƮB)', 82000, 2500, '22/09/14');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 5, '�������� �Ŀ��ϱ�', 5000, 100000, '22/07/01');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 5, '�¶����ʴ�� SET', 60000, 150, '22/08/22');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 5, '������ SET', 80000, 300, '22/08/22');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 6, '�������� �Ŀ��ϱ�', 1000, 100000, '22/07/20');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 6, '���� <�� ����> USB ��Ű��', 35000, 150, '22/09/17');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 6, '���⿡�� <�� ����> �޷� ��Ű��', 50000, 300, '22/09/17');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 7, '�������� �Ŀ��ϱ�', 1000, 100000, '22/05/03');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 7, '<"�޷���! �θ޶�"> ��ۺ� ����', 49900, 2000, '22/06/30');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 7, '<��Ŭ�������� ���� + ��������> ��������, ��ۺ� ����', 59900, 2500, '22/06/30');
-- ����
--��������
insert into REWARD values (SEQ_REWARD_NUM.nextval, 8, '�Һ�������Ǹ� �������', 47000, 1000, '19/10/22');
--��ġ�Ǹ�����
insert into REWARD values (SEQ_REWARD_NUM.nextval, 9, '�ҽ�����Ŭ�� 1��', 33300, 1000, '22/05/25');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 9, '�ҽ�����Ŭ�� 1��+����������', 39500, 500, '22/05/25');
--�Ѷ��Ѷ�������
insert into REWARD values (SEQ_REWARD_NUM.nextval, 10, 'setA', 37500, 330, '20/04/12');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 10, 'setB', 72400, 195, '20/04/12');
--����� ������
insert into REWARD values (SEQ_REWARD_NUM.nextval, 11, '���ົ ����+����ŷ������', 89850, 380, '22/05/30');

-- ����
insert into REWARD values (SEQ_REWARD_NUM.nextval, 12, '�����ý��丮 OST : Black Heaven (1��)', 55850, 400, '22/06/30');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 12, '����ī�� �䳢��� ���� 1��(����) ��ȯ ���� (1��)', 48000, 800, '22/06/30');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 13, 'ȯ���� ���ĵκ� �˾� ��Ű��', 45500, 200, '22/07/01');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 13, 'ȭ���� ���ε� ������ ��Ʈ', 75000, 200, '22/07/01');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 13, 'Ȳ������ ������ ������ �ı⼼Ʈ + �ѹ��� ���� ī��', 89500, 100, '22/07/01');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 14, 'CD �ٹ� ��Ű��', 55000, 500, '22/05/28');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 15, '�޺�õ�� ����(33,000��)', 33000, 800, '22/12/31');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 15, 'USB�� �ٹ� ����(55,000��)', 55000, 600, '22/12/31');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 16, '4.4��Ű��', 55000, 700, '22/06/14');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 16, '7.7��Ű�� 3D��Ƽŧ�� 2�� ��Ʈ', 77000, 700, '22/06/14');

-- ��Ƽ
insert into REWARD values (SEQ_REWARD_NUM.nextval, 17, '��Ʈ ���� �� ƾƮ �ܸ� ���� �����', 25500, 50, '22/05/06');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 17, '��Ʈ ���� �� ƾƮ Ű�� ��ȹ �ܸ� ���� �����', 25000, 50, '22/05/06');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 17, '���̳� ������ �ȷ�Ʈ5', 25000, 50, '22/05/06');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 17, 'Ŀ���� �հſ� ��ƼĿ ��ȹ �ܸ� ���� �����', 25000, 50, '22/05/06');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 18, '��������Ʈ', 1000, 500, '22/03/28');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 18, '��ī�ݶ�', 1000, 500, '22/03/28');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 19, '[���ϴ�Ǫ]��ϵ� �� �� ��Ǿ 30mL', 36000, 500, '22/05/05');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 19, '[���ϴ�Ǫ]��ϵ� �� �� ��Ǿ 30mL(x2)', 72000, 500, '22/05/05');
insert into REWARD values (SEQ_REWARD_NUM.nextval, 19, '[���ϴ�Ǫ]��ϵ� �� �� ��Ǿ 30mL + ���� ������Ʈ ��ǰ �����', 72000, 500, '22/05/05');
--��ȭ
--select * from REWARD;



-- MEM_ORDER
insert into MEM_ORDER values (SEQ_MORDER_NUM.nextval, 5, 7, 'kosmo01@naver.com', '���ϳ�', 15000, SYSDATE, '��������', '����� �ٲ��ּ���', '�����غ�');
insert into MEM_ORDER values (SEQ_MORDER_NUM.nextval, 2, 6, 'aa@naver.com', '�質��', 35000, SYSDATE, '��������', null, '�����غ�');
insert into MEM_ORDER values (SEQ_MORDER_NUM.nextval, 2, 5, 'aa@naver.com', '�質��', 37000, SYSDATE, '��������', null, '�����غ�');
--select * from MEM_ORDER;



-- COMMUNITY
insert into COMMUNITY values (SEQ_COMMUNITY_NUM.nextval, 1, 'aa@naver.com', '������Ʈ ����', '������Ʈ ���� ����', SYSDATE, SYSDATE, 0);
insert into COMMUNITY values (SEQ_COMMUNITY_NUM.nextval, 2, 'bb@naver.com', '[�����̺�Ʈ]�����ϼ���', '3�� 27�� (��) PM11:59���� �ݵ��ϸ� ��÷�� ���� 10���� ��� �Ĺ� �� ȭ���� �帳�ϴ�!', SYSDATE, SYSDATE, 26);
insert into COMMUNITY values (SEQ_COMMUNITY_NUM.nextval, 2, 'bb@naver.com', '[72�ð� EVENT]', '�ݵ������� 72�ð� ���� �ݵ��ϸ� ��÷�� ���� LED�Ĺ������� �帳�ϴ�..', SYSDATE, SYSDATE, 15);
insert into COMMUNITY values (SEQ_COMMUNITY_NUM.nextval, 2, 'bb@naver.com', '���� ���� TOP20 �����մϴ�', '���� �����ֽ� ������ �����в� ����帳�ϴ�!', SYSDATE, SYSDATE, 21);
--select * from COMMUNITY;


-- NOTICE
insert into NOTICE values (SEQ_NOTICE_NUM.nextval, '�Ŀ��� �ߴµ� �Ŀ������ �� ���Ϳ�', '�Ŀ��Ͻ� ������ �ƴ� �ٸ� �������� �α����ϼ��� �� �ֽ��ϴ�. �α��� ������ Ȯ�����ּ���!', SYSDATE, 712);
insert into NOTICE values (SEQ_NOTICE_NUM.nextval, '���� ���� �����带 �Ŀ��ϰ� �;��', '�� ������Ʈ�� �� ���� ������ �����Ͽ� �Ŀ��� �� �ֽ��ϴ�. �ٸ� â���ڿ��� ���� �� â���ڰ� �̸� �ݿ��Ͽ� �����带 ���� �� �ֽ��ϴ�.', SYSDATE, 32);
insert into NOTICE values (SEQ_NOTICE_NUM.nextval, '���� �������� �����µ� ����� �� �Ϳ�', 'â���ڰ� ������Ʈ ������ �� "Ŀ�´�Ƽ"�� �������׿� ���� ������Ʈ�� �÷ȴ��� ���� Ȯ�����ּ���.', SYSDATE, 32);
insert into NOTICE values (SEQ_NOTICE_NUM.nextval, '����� ���� ���ε� �ݵ��� �� �ֳ���?', '��Ĺ�� �����/���� ���ο� ������� ������Ʈ ������ �����մϴ�. �ּ� �ڰ� ����� Ȯ�����ּ���!', SYSDATE, 95);
insert into NOTICE values (SEQ_NOTICE_NUM.nextval, '���� ������ ������ �� ���ƿ�', '��� ������ �������� ���� �����Ϻ��� �߼��� �ʾ����ٸ�, �Ŀ��ڲ��� �Ƚ��ϰ� ��ٸ��� �� �ֵ��� Ŀ�´�Ƽ�� ��� ������ ���� ������ �Խ����ּ���.', SYSDATE, 34);
--select * from NOTICE;

commit;



