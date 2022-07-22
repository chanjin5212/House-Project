CREATE TABLE tblMember (
	id	varchar2(30)		NOT NULL,
	name	varchar2(15)		NOT NULL,
	email	varchar2(90)		NOT NULL,
	ssn	varchar2(14)		NOT NULL,
	tel	varchar2(13)		NOT NULL,
	address	varchar2(100)		NOT NULL,
	pw	varchar2(15)		NOT NULL,
	active	varchar2(10)		NOT NULL,
	lv	varchar2(1)		NOT NULL,
	x	varchar2(100)		NOT NULL,
	y	varchar2(100)		NOT NULL
);

-- select count(*) from tblMember m inner join tblBroker b on m.id = b.id where id = ?;

CREATE TABLE tblBroker (
	seq	number		NOT NULL,
	id	varchar2(30)		NOT NULL,
	firmName	varchar2(100)		NOT NULL,
	firmNum	varchar2(100)		NOT NULL,
	corporateNum	varchar2(100)		NOT NULL,
	firmAddress	varchar2(100)		NOT NULL,
	representName	varchar2(15)		NOT NULL,
	firmTel	varchar2(12)		NOT NULL,
	profileImg	varchar2(100)		NOT NULL
);

CREATE TABLE tblRealEstate (
	seq	number		NOT NULL,
	memberId	varchar(30)		NOT NULL,
	ownerSeq	number		NOT NULL,
	buildingTypeSeq	number		NOT NULL,
	contractSeq	number		NOT NULL,
	realEstateAddr	varchar2(100)		NOT NULL,
	brokerReward	number		NOT NULL,
	createDate	date	DEFAULT sysdate	NOT NULL,
	updateDate	date default sysdate		NOT NULL,
	price	number		NOT NULL,
	dealState	varchar2(30)		NOT NULL,
	introduce	 varchar2(3000)		NOT NULL,
	moveInDate	varchar2(30)		NOT NULL,
	petOk varchar2(1)		NOT NULL,
	loanOk	varchar2(1)		NOT NULL,
	coordinateX	number		NOT NULL,
	coordinateY	number		NOT NULL
);




CREATE TABLE tblStayReview (
	seq	number		NOT NULL,
	id	varchar2(30)		NOT NULL,
	realEstateSeq	number		NOT NULL,
	regdate	date	DEFAULT sysdate	NOT NULL,
	title	varchar2(1500)		NOT NULL,
	content	varchar2(3000)		NOT NULL,
	trafficStarRate	number		NOT NULL,
	surroundingsStarRate	number		NOT NULL,
	residentialStarRate	number		NOT NULL,
	apartmentStarRate	number		NOT NULL,
	views	number		NOT NULL
);

CREATE TABLE tblOption (
	seq	number		NOT NULL,
	realEstateSeq	number		NOT NULL,
	television	varchar2(1)		NOT NULL,
	airConditioner	varchar2(1)		NOT NULL,
	refrigerator	varchar2(1)		NOT NULL,
	washingMachine	varchar2(1)		NOT NULL,
	dryer	varchar2(1)		NOT NULL,
	induction	varchar2(1)		NOT NULL,
	gasRange	varchar2(1)		NOT NULL,
	desk	varchar2(1)		NOT NULL,
	bookshelf	varchar2(1)		NOT NULL,
	bed	varchar2(1)		NOT NULL,
	closet	varchar2(1)		NOT NULL,
	dishWasher	varchar2(1)		NOT NULL,
	shoeCloset	varchar2(1)		NOT NULL
);

CREATE TABLE tblManagementFee (
	seq	number	DEFAULT 0	NOT NULL,
	realEstateSeq	number		NOT NULL,
	amount	number		NOT NULL,
	electricityBill	varchar2(1)	DEFAULT 'n'	NOT NULL,
	gasBill	varchar2(1)	DEFAULT 'n'	NOT NULL,
	waterBill	varchar2(1)	DEFAULT 'n'	NOT NULL,
	televisionBill	varchar2(1)	DEFAULT 'n'	NOT NULL,
	internetBill	varchar2(1)	DEFAULT 'n'	NOT NULL,
	parkingBill	varchar2(1)	DEFAULT 'n'	NOT NULL
);


CREATE TABLE tblDeposit (
	seq	number		NOT NULL,
	RealEstateSeq	number		NOT NULL,
	deposit	number		NOT NULL
);

CREATE TABLE tblWish (
	seq	VARCHAR(255)		NOT NULL,
	id	varchar2(30)		NOT NULL,
	realEstateSeq	number	DEFAULT 0	NOT NULL
);

CREATE TABLE tblReport (
	seq	number		NOT NULL,
	id	varchar2(30)		NOT NULL,
	realEstateSeq	number		NOT NULL,
	content	varchar2(3000)		NOT NULL,
	state	varchar2(20)		NOT NULL
);

CREATE TABLE tblReportType (
	seq	number		NOT NULL,
	name	varchar2(30)		NOT NULL
);

CREATE TABLE tblParking (
	seq	number		NOT NULL,
	realEstateSeq	number		NOT NULL,
	parkingStatus	varchar2(1)		NOT NULL,
	numParkSpace	varchar2(10)		NOT NULL
);

CREATE TABLE tblReportList (
	seq	number		NOT NULL,
	reportSeq	number		NOT NULL,
	reportTypeSeq	number		NOT NULL
);

CREATE TABLE tblLike (
	seq	number		NOT NULL,
	id	varchar2(30)		NOT NULL,
	stayReviewSeq	number		NOT NULL,
	good	number		NOT NULL
);

CREATE TABLE tblManager (
	id	varchar2(30)		NOT NULL,
	pw	varchar2(15)		NOT NULL
);

CREATE TABLE tblBrokerScore (
	seq	number		NOT NULL,
	id	varchar2(30)		NOT NULL,
	counselSeq	number		NOT NULL,
	star	number		NOT NULL
);

CREATE TABLE tblContractDoc (
	seq	number		NOT NULL,
	realEstateSeq	number		NOT NULL,
	id	varchar2(30)		NOT NULL,
	balanceDate	varchar2(20)		NOT NULL,
	contractDate	date	DEFAULT sysdate	NOT NULL,
	land	varchar2(100)		NOT NULL,
	structural	varchar2(100)		NOT NULL,
	downPayment	number		NOT NULL,
    name varchar2(15) null,
    address varchar2(100) null,
    ssn varchar2(14) null
);



alter table tblContractDoc modify name null;
alter table tblContractDoc modify address null;
alter table tblContractDoc modify ssn null;

CREATE TABLE tblCounsel (
	seq	number		NOT NULL,
	memberId	varchar2(30)		NOT NULL,
	realEstateSeq	number	DEFAULT 0	NOT NULL,
	content	varchar2(3000)		NOT NULL,
	state	varchar2(30)		NOT NULL,
	writeDate	date	DEFAULT sysdate	NOT NULL,
	completeDate	date		NULL
);

CREATE TABLE tblOwner (
	seq	number		NOT NULL,
	deputySeq	number		NOT NULL,
	name	varchar2(15)		NOT NULL,
	ssn	varchar2(14)		NOT NULL,
	address	varchar2(100)		NOT NULL,
	tel	varchar2(13)		NOT NULL
);


CREATE TABLE tblDeputy (
	seq	number		NOT NULL,
	name	varchar2(15)		NOT NULL,
	address	varchar2(100)		NOT NULL,
	ssn	varchar2(100)		NOT NULL
);

CREATE TABLE tblMontly (
	seq	number		NOT NULL,
	contractDoc	number		NOT NULL,
	borrowedMoney	varchar2(20)		NOT NULL,
	endDate	varchar2(20)		NOT NULL
);

CREATE TABLE tblTrading (
	seq	number		NOT NULL,
	contractDocSeq	number		NOT NULL,
	loanAmount	number	DEFAULT 0	NOT NULL,
	rentalDeposit	number	DEFAULT 0	NOT NULL
);

CREATE TABLE tblCharter (
	seq	number		NOT NULL,
	contractDoc	number		NOT NULL,
	endDate	varchar2(20)		NOT NULL
);

CREATE TABLE tblBank (
	seq	number		NOT NULL,
	tradingSeq	number		NOT NULL,
	bank	varchar2(100)		NOT NULL
);

CREATE TABLE tblStructure (
	seq	number		NOT NULL,
	RealEstateSeq	number		NOT NULL,
	roomTypeSeq	number		NOT NULL,
	mainUseSeq	number		NOT NULL,
	numRoom	number		NOT NULL,
	numToilets	number		NOT NULL,
	numBalcony	number		NOT NULL,
	heatingType	varchar2(10)		NOT NULL,
	direction	varchar2(6)		NOT NULL,
	built	varchar2(30)		NOT NULL,
	buildingFloor	varchar2(5)		NOT NULL,
	theFloor	varchar2(5)		NOT NULL,
	dedicatedArea	varchar2(10)		NOT NULL,
	supplyArea	varchar2(10)		NOT NULL,
	elevatorStatus	varchar2(1)		NOT NULL
);

CREATE TABLE tblRoomType (
	seq	number		NOT NULL,
	name	varchar2(30)		NOT NULL
);

CREATE TABLE tblContract (
	seq	number		NOT NULL,
	name	varchar2(10)		NOT NULL
);

CREATE TABLE tblBuildingType (
	seq	number		NOT NULL,
	name	varchar2(15)		NOT NULL
);

CREATE TABLE tblMainUse (
	seq	number		NOT NULL,
	name	varchar2(30)		NOT NULL
);

CREATE TABLE tblContractRequest (
	seq	number		NOT NULL,
	realEstateSeq	number	DEFAULT 0	NOT NULL,
	id	varchar2(30)		NOT NULL,
	checkIndDate	varchar2(20)		NOT NULL,
	brokerCheck	varchar2(100)		NOT NULL,
	state	varchar2(10)		NOT NULL
);

CREATE TABLE tblReportPicture (
	seq	number		NOT NULL,
	reportSeq	number		NOT NULL,
	jpg	varchar2(30)		NOT NULL
);



CREATE TABLE tblRealEstatePicture (
	seq	number		NOT NULL,
	realEstateSeq	number		NOT NULL,
	jpg 	varchar2(1000)		NOT NULL
);



CREATE TABLE tblReviewPicture (
	seq	number		NOT NULL,
	stayReviewSeq	number		NOT NULL,
	jpg	varchar2(30)		NOT NULL
);

CREATE TABLE tblRefusal (
	seq	number		NOT NULL,
	Field	varchar2(1500)		NULL
);



create sequence seqMember start with 11;
create sequence seqBroker start with 11;
create sequence seqRealEstate start with 11;
create sequence seqStayReview start with 11;
create sequence seqOption start with 11; 
create sequence seqManagementFee start with 11;
create sequence seqDeposit start with 11;
create sequence seqWish start with 11;
create sequence seqReport start with 11; 
create sequence seqReportType start with 11; 
create sequence seqParking start with 11; 
create sequence seqReportList start with 11; 
create sequence seqLike start with 11; 
create sequence seqBrokerScore start with 11; 
create sequence seqContractDoc start with 11;
create sequence seqCounsel start with 11; 
create sequence seqOwner start with 11; 
create sequence seqMemDeputy start with 11; 
create sequence seqDeputy start with 11; 
create sequence seqMontly start with 11;
create sequence seqTrading start with 11; 
create sequence seqCharter start with 11; 
create sequence seqBank start with 11; 
create sequence seqStructure start with 11; 
create sequence seqRoomType start with 11;
create sequence seqContract start with 11; 
create sequence seqBuildingType start with 11; 
create sequence seqMainUse start with 11;
create sequence seqContractRequest start with 11; 
create sequence seqReportPicture start with 11; 
create sequence seqRealEstatePicture start with 11; 
create sequence seqReviewPicture start with 11; 
create sequence seqRefusal start with 11; 




ALTER TABLE tblMember ADD CONSTRAINT PK_TBLMEMBER PRIMARY KEY (
	id
);

ALTER TABLE tblBroker ADD CONSTRAINT PK_TBLBROKER PRIMARY KEY (
	seq
);

ALTER TABLE tblRealEstate ADD CONSTRAINT PK_TBLREALESTATE PRIMARY KEY (
	seq
);

ALTER TABLE tblStayReview ADD CONSTRAINT PK_TBLSTAYREVIEW PRIMARY KEY (
	seq
);

ALTER TABLE tblOption ADD CONSTRAINT PK_TBLOPTION PRIMARY KEY (
	seq
);

ALTER TABLE tblManagementFee ADD CONSTRAINT PK_TBLMANAGEMENTFEE PRIMARY KEY (
	seq
);

ALTER TABLE tblDeposit ADD CONSTRAINT PK_TBLDEPOSIT PRIMARY KEY (
	seq
);

ALTER TABLE tblWish ADD CONSTRAINT PK_TBLWISH PRIMARY KEY (
	seq
);

ALTER TABLE tblReport ADD CONSTRAINT PK_TBLREPORT PRIMARY KEY (
	seq
);

ALTER TABLE tblReportType ADD CONSTRAINT PK_TBLREPORTTYPE PRIMARY KEY (
	seq
);

ALTER TABLE tblParking ADD CONSTRAINT PK_TBLPARKING PRIMARY KEY (
	seq
);

ALTER TABLE tblReportList ADD CONSTRAINT PK_TBLREPORTLIST PRIMARY KEY (
	seq
);

ALTER TABLE tblLike ADD CONSTRAINT PK_TBLLIKE PRIMARY KEY (
	seq
);

ALTER TABLE tblManager ADD CONSTRAINT PK_TBLMANAGER PRIMARY KEY (
	id
);

ALTER TABLE tblBrokerScore ADD CONSTRAINT PK_TBLBROKERSCORE PRIMARY KEY (
	seq
);

ALTER TABLE tblContractDoc ADD CONSTRAINT PK_TBLCONTRACTDOC PRIMARY KEY (
	seq
);

ALTER TABLE tblCounsel ADD CONSTRAINT PK_TBLCOUNSEL PRIMARY KEY (
	seq
);

ALTER TABLE tblOwner ADD CONSTRAINT PK_TBLOWNER PRIMARY KEY (
	seq
);

ALTER TABLE tblDeputy ADD CONSTRAINT PK_TBLDEPUTY PRIMARY KEY (
	seq
);

ALTER TABLE tblMontly ADD CONSTRAINT PK_TBLMONTLY PRIMARY KEY (
	seq
);

ALTER TABLE tblTrading ADD CONSTRAINT PK_TBLTRADING PRIMARY KEY (
	seq
);

ALTER TABLE tblCharter ADD CONSTRAINT PK_TBLCHARTER PRIMARY KEY (
	seq
);

ALTER TABLE tblBank ADD CONSTRAINT PK_TBLBANK PRIMARY KEY (
	seq
);

ALTER TABLE tblStructure ADD CONSTRAINT PK_TBLSTRUCTURE PRIMARY KEY (
	seq
);

ALTER TABLE tblRoomType ADD CONSTRAINT PK_TBLROOMTYPE PRIMARY KEY (
	seq
);

ALTER TABLE tblContract ADD CONSTRAINT PK_TBLCONTRACT PRIMARY KEY (
	seq
);

ALTER TABLE tblBuildingType ADD CONSTRAINT PK_TBLBUILDINGTYPE PRIMARY KEY (
	seq
);

ALTER TABLE tblMainUse ADD CONSTRAINT PK_TBLMAINUSE PRIMARY KEY (
	seq
);

ALTER TABLE tblContractRequest ADD CONSTRAINT PK_TBLCONTRACTREQUEST PRIMARY KEY (
	seq
);

ALTER TABLE tblReportPicture ADD CONSTRAINT PK_TBLREPORTPICTURE PRIMARY KEY (
	seq
);

ALTER TABLE tblRealEstatePicture ADD CONSTRAINT PK_TBLREALESTATEPICTURE PRIMARY KEY (
	seq
);

ALTER TABLE tblReviewPicture ADD CONSTRAINT PK_TBLREVIEWPICTURE PRIMARY KEY (
	seq
);

ALTER TABLE tblRefusal ADD CONSTRAINT PK_TBLREFUSAL PRIMARY KEY (
	seq
);


ALTER TABLE tblBroker ADD CONSTRAINT FK_tblMember_TO_tblBroker_1 FOREIGN KEY (
	id
)
REFERENCES tblMember (
	id
);

ALTER TABLE tblRealEstate ADD CONSTRAINT FK_tblMember_tblRealEstate_1 FOREIGN KEY (
	memberId
)
REFERENCES tblMember (
	id
);

ALTER TABLE tblRealEstate ADD CONSTRAINT FK_tblOwner_TO_tblRealEstate_1 FOREIGN KEY (
	ownerSeq
)
REFERENCES tblOwner (
	seq
);

ALTER TABLE tblRealEstate ADD CONSTRAINT FK_tblRealEstate_1 FOREIGN KEY (
	buildingTypeSeq
)
REFERENCES tblBuildingType (
	seq
);

ALTER TABLE tblRealEstate ADD CONSTRAINT FK_tblContract_tblRealEstate_1 FOREIGN KEY (
	contractSeq
)
REFERENCES tblContract (
	seq
);

ALTER TABLE tblStayReview ADD CONSTRAINT FK_tblMember_tblStayReview_1 FOREIGN KEY (
	id
)
REFERENCES tblMember (
	id
);

ALTER TABLE tblStayReview ADD CONSTRAINT FK_tblStayReview_1 FOREIGN KEY (
	realEstateSeq
)
REFERENCES tblRealEstate (
	seq
);

ALTER TABLE tblOption ADD CONSTRAINT FK_tblRealEstate_tblOption_1 FOREIGN KEY (
	realEstateSeq
)
REFERENCES tblRealEstate (
	seq
);

ALTER TABLE tblManagementFee ADD CONSTRAINT FK_tblManagementFee_1 FOREIGN KEY (
	realEstateSeq
)
REFERENCES tblRealEstate (
	seq
);

ALTER TABLE tblDeposit ADD CONSTRAINT FK_tblRealEstate_tblDeposit_1 FOREIGN KEY (
	RealEstateSeq
)
REFERENCES tblRealEstate (
	seq
);

ALTER TABLE tblWish ADD CONSTRAINT FK_tblMember_TO_tblWish_1 FOREIGN KEY (
	id
)
REFERENCES tblMember (
	id
);

ALTER TABLE tblWish ADD CONSTRAINT FK_tblRealEstate_TO_tblWish_1 FOREIGN KEY (
	realEstateSeq
)
REFERENCES tblRealEstate (
	seq
);

ALTER TABLE tblReport ADD CONSTRAINT FK_tblMember_TO_tblReport_1 FOREIGN KEY (
	id
)
REFERENCES tblMember (
	id
);

ALTER TABLE tblReport ADD CONSTRAINT FK_tblRealEstate_tblReport_1 FOREIGN KEY (
	realEstateSeq
)
REFERENCES tblRealEstate (
	seq
);

ALTER TABLE tblParking ADD CONSTRAINT FK_tblRealEstate_tblParking_1 FOREIGN KEY (
	realEstateSeq
)
REFERENCES tblRealEstate (
	seq
);

ALTER TABLE tblReportList ADD CONSTRAINT FK_tblReport_tblReportList_1 FOREIGN KEY (
	reportSeq
)
REFERENCES tblReport (
	seq
);

ALTER TABLE tblReportList ADD CONSTRAINT FK_tblReportList_1 FOREIGN KEY (
	reportTypeSeq
)
REFERENCES tblReportType (
	seq
);

ALTER TABLE tblLike ADD CONSTRAINT FK_tblMember_TO_tblLike_1 FOREIGN KEY (
	id
)
REFERENCES tblMember (
	id
);

ALTER TABLE tblLike ADD CONSTRAINT FK_tblStayReview_TO_tblLike_1 FOREIGN KEY (
	stayReviewSeq
)
REFERENCES tblStayReview (
	seq
);

ALTER TABLE tblBrokerScore ADD CONSTRAINT FK_tblMember_tblBrokerScore_1 FOREIGN KEY (
	id
)
REFERENCES tblMember (
	id
);

ALTER TABLE tblBrokerScore ADD CONSTRAINT FK_tblCounsel_tblBrokerScore_1 FOREIGN KEY (
	counselSeq
)
REFERENCES tblCounsel (
	seq
);

ALTER TABLE tblContractDoc ADD CONSTRAINT FK_tblContractDoc_1 FOREIGN KEY (
	realEstateSeq
)
REFERENCES tblRealEstate (
	seq
);

ALTER TABLE tblContractDoc ADD CONSTRAINT FK_tblMember_tblContractDoc_1 FOREIGN KEY (
	id
)
REFERENCES tblMember (
	id
);

ALTER TABLE tblCounsel ADD CONSTRAINT FK_tblMember_TO_tblCounsel_1 FOREIGN KEY (
	memberId
)
REFERENCES tblMember (
	id
);

ALTER TABLE tblCounsel ADD CONSTRAINT FK_tblRealEstate_tblCounsel_1 FOREIGN KEY (
	realEstateSeq
)
REFERENCES tblRealEstate (
	seq
);

ALTER TABLE tblOwner ADD CONSTRAINT FK_tblDeputy_TO_tblOwner_1 FOREIGN KEY (
	deputySeq
)
REFERENCES tblDeputy (
	seq
);

ALTER TABLE tblMontly ADD CONSTRAINT FK_tblContractDoc_tblMontly_1 FOREIGN KEY (
	contractDoc
)
REFERENCES tblContractDoc (
	seq
);

ALTER TABLE tblTrading ADD CONSTRAINT FK_tblContractDoc_tblTrading_1 FOREIGN KEY (
	contractDocSeq
)
REFERENCES tblContractDoc (
	seq
);

ALTER TABLE tblCharter ADD CONSTRAINT FK_tblContractDoc_tblCharter_1 FOREIGN KEY (
	contractDoc
)
REFERENCES tblContractDoc (
	seq
);

ALTER TABLE tblBank ADD CONSTRAINT FK_tblTrading_TO_tblBank_1 FOREIGN KEY (
	tradingSeq
)
REFERENCES tblTrading (
	seq
);

ALTER TABLE tblStructure ADD CONSTRAINT FK_tblStructure_1 FOREIGN KEY (
	RealEstateSeq
)
REFERENCES tblRealEstate (
	seq
);

ALTER TABLE tblStructure ADD CONSTRAINT FK_tblRoomType_tblStructure_1 FOREIGN KEY (
	roomTypeSeq
)
REFERENCES tblRoomType (
	seq
);

ALTER TABLE tblStructure ADD CONSTRAINT FK_tblMainUse_tblStructure_1 FOREIGN KEY (
	mainUseSeq
)
REFERENCES tblMainUse (
	seq
);

ALTER TABLE tblContractRequest ADD CONSTRAINT FK_tblRealEstate FOREIGN KEY (
	realEstateSeq
)
REFERENCES tblRealEstate (
	seq
);

ALTER TABLE tblContractRequest ADD CONSTRAINT FK_tblMember FOREIGN KEY (
	id
)
REFERENCES tblMember (
	id
);

ALTER TABLE tblReportPicture ADD CONSTRAINT FK_tblReport FOREIGN KEY (
	reportSeq
)
REFERENCES tblReport (
	seq
);

ALTER TABLE tblRealEstatePicture ADD CONSTRAINT FK_tblRealEstate_TO_tb FOREIGN KEY (
	realEstateSeq
)
REFERENCES tblRealEstate (
	seq
);

ALTER TABLE tblReviewPicture ADD CONSTRAINT FK_tblStayReview_T FOREIGN KEY (
	stayReviewSeq
)
REFERENCES tblStayReview (
	seq
);

ALTER TABLE tblRefusal ADD CONSTRAINT FK_tblRefusal_1 FOREIGN KEY (
	seq
)
REFERENCES tblContractRequest (
	seq
);



