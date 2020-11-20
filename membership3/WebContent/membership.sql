/* 회원 */
CREATE TABLE scott.Member (
	userid CHAR(14) NOT NULL, /* 아이디 */
	passwd CHAR(10) NOT NULL, /* 비밀번호 */
	name VARCHAR2(20) NOT NULL, /* 회원이름 */
	email VARCHAR2(50) NOT NULL, /* 회원이메일 */
	gender CHAR(1) DEFAULT 2 NOT NULL, /* 성별 */
	city VARCHAR2(20), /* 거주지 */
	age NUMBER(3) /* 나이 */
);

COMMENT ON TABLE scott.Member IS '회원';

COMMENT ON COLUMN scott.Member.userid IS '아이디';

COMMENT ON COLUMN scott.Member.passwd IS '비밀번호';

COMMENT ON COLUMN scott.Member.name IS '회원이름';

COMMENT ON COLUMN scott.Member.email IS '회원이메일';

COMMENT ON COLUMN scott.Member.gender IS '성별';

COMMENT ON COLUMN scott.Member.city IS '거주지';

COMMENT ON COLUMN scott.Member.age IS '나이';

CREATE UNIQUE INDEX scott.PK_Member
	ON scott.Member (
		userid ASC
	);

ALTER TABLE scott.Member
	ADD
		CONSTRAINT PK_Member
		PRIMARY KEY (
			userid
		);
		

CREATE OR REPLACE PROCEDURE sp_member_login
(
    v_userid     IN      member.userid%TYPE,
    login_record     OUT      SYS_REFCURSOR
)
IS
BEGIN
    OPEN login_record FOR
    SELECT passwd FROM Member
    WHERE userid = v_userid;
    
END;


CREATE OR REPLACE PROCEDURE sp_member_insert
(
    v_userid     IN    member.userid%TYPE,
    v_passwd     IN    member.passwd%TYPE,
    v_name     IN    member.name%TYPE,
    v_email     IN    member.email%TYPE,
    v_gender     IN    member.gender%TYPE,
    v_city     IN    member.city%TYPE,
    v_age     IN    member.age%TYPE
)
IS
BEGIN
    INSERT INTO Member
    VALUES(v_userid, v_passwd, v_name, v_email, v_gender, v_city, v_age);
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE sp_member_select
(
    v_userid   IN    member.userid%TYPE,
    member_record   OUT    SYS_REFCURSOR
)
AS
BEGIN
    OPEN member_record FOR
    SELECT name, email, gender, city, age, flag
    FROM Member
    WHERE userid = v_userid;
END;

CREATE OR REPLACE PROCEDURE sp_member_delete
(
    v_userid   IN    member.userid%TYPE
)
AS
BEGIN
    DELETE FROM Member
    WHERE userid = v_userid;
    
    COMMIT;
END;

--update하는 프로시저
CREATE OR REPLACE PROCEDURE sp_member_update
(
    v_userid    IN  member.userid%TYPE,
    v_email     IN  member.email%TYPE,
    v_city      IN  member.city%TYPE,
    v_age       IN  member.age%TYPE
)
IS
BEGIN
    UPDATE Member       --member테이블을 업데이트
    SET email = v_email, city = v_city, age = v_age
    WHERE userid = v_userid;
    COMMIT;     --update 후, 깔끔하게 COMMIT까지!
END;


--회원정보를 출력하는 프로시저
CREATE OR REPLACE PROCEDURE sp_member_select_all
(
    member_record   OUT    SYS_REFCURSOR
)
AS
BEGIN
    OPEN member_record FOR
    SELECT userid, name, email, gender, city, age  --회원의 정보를 SELECT.
    FROM Member;
END;


--권한 부여하는 칼럼 추가  -- 1 : 유저, 0 : 관리자
ALTER TABLE Member
ADD flag NUMBER(1) DEFAULT 1 NOT NULL;

--관리자 추가
INSERT INTO Member(userid, passwd, name, email, gender, city, age, flag)
VALUES('admin', 'admin', '관리자', 'admin@example.com', '2', NULL, NULL, 0);
