create or replace view vwReview
as
select sr.*, re.realestateaddr, b.name from tblStayReview sr inner join tblRealEstate re on sr.realEstateSeq = re.seq inner join tblbuildingtype b on re.buildingtypeseq = b.seq;


create or replace view vwBrokerContractList
as
select 
        c.seq as contractSeq, 
        c.realestateseq, 
        c.checkinddate, 
        c.brokercheck, 
        c.state, 
        c.id as userid, 
        (select tblcontract.name from tblcontract where tblcontract.seq = r.contractseq) as contractCategory, 
        r.realestateaddr,
        d.deposit,
        r.price,
        r.memberid as brokerid,
        cd.seq as contractDocSeq
        from tblcontractrequest c
    inner join tblrealestate r on c.realestateseq = r.seq
        left outer join tbldeposit d on r.seq = d.realestateseq
            left outer join tblcontractdoc cd
                on r.seq = cd.realestateseq;

create or replace view vwCouselList
as
select 
    c.seq,
    c.memberid,
    content,
    state,
    writedate,
    completedate,
    c.realestateseq,
    r.realestateaddr,
    r.memberid as brokerid,
    bs.seq as reviewSeq,
    bs.star as star,
    m.tel,
    m.name
from tblCounsel c
    inner join tblrealestate r
        on c.realestateseq = r.seq
            left outer join tblbrokerscore bs
                on c.seq = bs.counselseq
                    inner join tblmember m
                        on c.memberid = m.id;

create or replace view vwBrokerContractList
as
select 
        c.seq as contractSeq, 
        c.realestateseq, 
        c.checkinddate, 
        c.brokercheck, 
        c.state, 
        c.id as userid, 
        (select tblcontract.name from tblcontract where tblcontract.seq = r.contractseq) as contractCategory, 
        r.realestateaddr,
        d.deposit,
        r.price,
        r.memberid as brokerid
        from tblcontractrequest c
    inner join tblrealestate r on c.realestateseq = r.seq
        left outer join tbldeposit d on r.seq = d.realestateseq;



create or replace view vwContractviewe
as
select
cr.id,cr.seq,c.name,re.price,re.realestateaddr,re.moveindate,cr.state
from tblContractRequest cr
inner join tblRealEstate re
on cr.realestateseq = re.seq
inner join tblContract c
on re.contractseq = c.seq;


create or replace view vwUserdeallist
as
select
cr.id,cr.seq,c.name,re.price,re.realestateaddr,re.moveindate,cr.state,cd.contractdate
from tblContractRequest cr
inner join tblRealEstate re
on cr.realestateseq = re.seq
inner join tblContract c
on re.contractseq = c.seq
inner join tblContractDoc cd
on cd.id = cr.id;


create or replace view vwCounselre
as
 select
cr.id,cr.seq,c.name,re.price,re.realestateaddr,b.firmname,re.moveindate,cr.state,cd.contractdate,cu.content,bs.star,m.name,m.tel
from tblContractRequest cr
inner join tblRealEstate re
on cr.realestateseq = re.seq
inner join tblContract c
on re.contractseq = c.seq
inner join tblContractDoc cd
on cd.id = cr.id
inner join tblCounsel cu
on cu.memberid = cr.id
inner join tblBrokerScore bs
on cu.memberid = bs.id
inner join tblMember m
on m.id = bs.id
inner join tblBroker b
on b.id = re.memberid;


 create or replace view vwCounselre23
as
 select
cr.id,cr.seq,c.name,m.name
from tblContractRequest cr
inner join tblRealEstate re
on cr.realestateseq = re.seq
inner join tblContract c
on re.contractseq = c.seq
inner join tblContractDoc cd
on cd.id = cr.id
inner join tblCounsel cu
on cu.memberid = cr.id
inner join tblBrokerScore bs
on cu.memberid = bs.id
inner join tblMember m
on m.id = bs.id
inner join tblBroker b
on b.id = re.memberid;


 create or replace view vwCounselistl
as
 select
cr.id,cr.seq,c.name,re.price,re.realestateaddr,b.firmname
from tblContractRequest cr
inner join tblRealEstate re
on cr.realestateseq = re.seq
inner join tblContract c
on re.contractseq = c.seq
inner join tblContractDoc cd
on cd.id = cr.id
inner join tblCounsel cu
on cu.memberid = cr.id
inner join tblBrokerScore bs
on cu.memberid = bs.id
inner join tblMember m
on m.id = bs.id
inner join tblBroker b
on b.id = re.memberid;


create or replace view vwCounselinfo
as
 select
cr.id,cr.seq, c.name as contractname,re.price,re.realestateaddr,cu.content,m.name,m.tel, re.memberid, mb.name as brokername
from tblContractRequest cr
inner join tblRealEstate re
on cr.realestateseq = re.seq
inner join tblContract c
on re.contractseq = c.seq
inner join tblContractDoc cd
on cd.id = cr.id
inner join tblCounsel cu
on cu.memberid = cr.id
inner join tblBrokerScore bs
on cu.memberid = bs.id
inner join tblMember m
on m.id = bs.id
inner join tblMember mb
on mb.id = re.memberid
inner join tblBroker b
on b.id = re.memberid;

create or replace view vwSimpleGoodsStatus
as
select rs.seq as seq, rs.realestateaddr as address, rs.price as price, rs.dealstate as dealstate, rs.coordinatex, rs.coordinatey, ct.name as category, bt.name as type, ds.deposit as deposit
from tblrealestate rs
inner join tblcontract ct on ct.seq = rs.contractseq
inner join tblbuildingtype bt on bt.seq = rs.buildingtypeseq
left join tbldeposit ds on rs.seq = ds.realestateseq;


create or replace view vwContract
as
select 
    cr.seq,
    cr.state,
    cr.checkinddate as checkindate,
    cr.brokercheck,
    r.realestateaddr,
    r.seq as realestateSeq,
    s.dedicatedarea as jywidth,
    s.supplyarea as gywidth,
    d.deposit,
    r.price,
    cd.balancedate,
    cd.land as toji,
    cr.id as userid,
    r.memberid as brokerid,
    cd.contractdate,
    cd.seq as contractDocSeq,
    cd.downpayment,
    cd.structural,
    c.name as category,
    m.name as mainuse,
    o.name as ownerName, --
    o.address as ownerAddr,
    o.ssn as ownerSSn,
    o.tel as ownerTel,
    odp.name as ownerDeputyName,
    odp.address as ownerDeputyAddr,
    odp.ssn as ownerDeputySsn,
    mem.name as userName, --
    mem.address as userAddr,
    mem.ssn as userSsn,
    mem.tel as userTel,
    cd.name as userDeputyName,
    cd.ssn as userDeputySsn,
    cd.address as userDeputyAddr,
    br.firmaddress as brokerAddr, --
    br.firmname as brokerName,
    br.representname as brokerRepresentName,
    br.firmnum,
    br.firmtel as brokerTel,
    tr.loanamount,
    tr.rentaldeposit,
    mt.borrowedmoney,
    mt.enddate monthEndDate,
    ch.enddate charterEndDate
from 
    tblcontractrequest cr
        inner join tblrealestate r
            on cr.realestateseq = r.seq
                inner join tblstructure s
                    on r.seq = s.realestateseq 
                        left outer join tblDeposit d
                            on r.seq = d.realestateseq
                                left outer join tblcontractdoc cd
                                    on r.seq = cd.realestateseq
                                        inner join tblcontract c
                                            on r.contractseq = c.seq
                                                inner join tblmainuse m
                                                    on s.mainuseseq = m.seq
                                                        inner join tblOwner o
                                                            on r.ownerseq = o.seq
                                                                inner join tbldeputy odp
                                                                    on o.deputyseq = odp.seq
                                                                        inner join tblmember mem
                                                                            on cr.id = mem.id
                                                                                inner join tblbroker br
                                                                                    on r.memberid = br.id
                                                                                        left outer join tbltrading tr
                                                                                            on cd.seq = tr.contractdocseq
                                                                                                left outer join tblmontly mt
                                                                                                    on cd.seq = mt.contractdoc
                                                                                                        left outer join tblcharter ch
                                                                                                            on cd.seq = ch.contractdoc;


                                                                                                    
                                                                                                            
create or replace view vwReviewe
as
select
    sr.seq,
    sr.id,
    sr.title,
    re.realestateaddr,
    sr.regdate
from tblRealEstate re
inner join tblStayReview sr
on re.seq = sr.realEstateSeq;

create or replace view vwBrokerContractDoneList
as
select 
        c.seq as contractDocSeq, 
        c.realestateseq, 
        c.id as userid,
        cr.state,
       (select tblcontract.name from tblcontract where tblcontract.seq = r.contractseq) as contractCategory, 
       c.contractdate,
        r.realestateaddr,
        (select deposit from tbldeposit where tbldeposit.realestateseq = r.seq) as deposit,
        r.price, 
        r.memberid as brokerid,
        sr.seq as reviewSeq
        from tblcontractdoc c
inner join tblrealestate r on c.realestateseq = r.seq
    inner join tblcontractrequest cr on c.realestateseq = cr.realestateseq
        left outer join tblstayreview sr on r.seq = sr.realestateseq;
        
    
