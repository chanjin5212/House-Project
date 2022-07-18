package com.house.web.brokerrealestate;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/brokerrealestate/brokerRealEstateAdd")
public class BrokerRealEstateAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		if (session.getAttribute("auth") == null) {
			resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();

            writer.println("<html>");
            writer.println("<body>");
            writer.println("<script>");
            writer.println("alert('중개사 로그인을 해주세요');");
            writer.println("location.href='/house/main'");
            writer.println("</script>");
            writer.println("</body>");
            writer.println("</html>");

            writer.close();
		}
		
		BrokerRealEstateDAO dao = new BrokerRealEstateDAO();
		
		ArrayList<BrokerRealEstateDTO> cList = dao.cGetList();
		ArrayList<BrokerRealEstateDTO> bList = dao.bGetList();
		ArrayList<BrokerRealEstateDTO> rList = dao.rGetList();
		ArrayList<BrokerRealEstateDTO> mList = dao.mGetList();
		
		req.setAttribute("cList", cList);
		req.setAttribute("bList", bList);
		req.setAttribute("rList", rList);
		req.setAttribute("mList", mList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/brokerrealestate/brokerRealEstateAdd.jsp");

		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		String path = req.getRealPath("/files");
		
		int size = 1024 * 1024 * 100;
		
		String txt = ""; 		
		String num = ""; 		
		
		ArrayList<String> filename = new ArrayList<String>();	
		ArrayList<String> orgfilename = new ArrayList<String>();
		
		MultipartRequest multi = null;
		
		try {
			
			multi = new MultipartRequest(
				  	req, 
				  	path,	 
				  	size, 	 
				  	"UTF-8", 
				  	new DefaultFileRenamePolicy() 
				 );
			
			txt = multi.getParameter("txt");
			num = multi.getParameter("num");
			
			//첨부파일들
			//<input type="file" name="attach1">
			//<input type="file" name="attach2">
			//<input type="file" name="attach3">
			
			Enumeration e = multi.getFileNames();
			
			while(e.hasMoreElements()) {
				String file = (String)e.nextElement();
				//System.out.println(file);
				
				//하드에 저장된 이름
				filename.add(multi.getFilesystemName(file));
				
				//사용자가 올린 이름
				orgfilename.add(multi.getOriginalFileName(file));
			}
			
			
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		//보증금 월세때만 존재
		String deposit = multi.getParameter("deposit");
		//기본 매물 정보
		String selectContract = multi.getParameter("selectContract");
		String selectBuilding = multi.getParameter("selectBuilding");
		String price = multi.getParameter("price");
		String brokerReward = multi.getParameter("brokerReward");
		String moveInDate = multi.getParameter("moveInDate");
		String petOk = multi.getParameter("petOk");
		String loanOk = multi.getParameter("loanOk");
		String introduce = multi.getParameter("introduce");
		String realEstateAddr = multi.getParameter("address") + " " + multi.getParameter("addressPlus");
		if (petOk == null) petOk = "n";
		if (loanOk == null) loanOk = "n";
		
		//관리비
		String amount = multi.getParameter("amount");
		String electricityBill = multi.getParameter("electricityBill");
		String gasBill = multi.getParameter("gasBill");
		String waterBill = multi.getParameter("waterBill");
		String televisionBill = multi.getParameter("televisionBill");
		String internetBill = multi.getParameter("internetBill");
		String parkingBill = multi.getParameter("parkingBill");
		if (electricityBill == null) electricityBill = "n";
		if (gasBill == null) gasBill = "n";
		if (waterBill == null) waterBill = "n";
		if (televisionBill == null) televisionBill = "n";
		if (internetBill == null) internetBill = "n";
		if (parkingBill == null) parkingBill = "n";
		
		//옵션 정보
		String television = multi.getParameter("television");
		String airConditioner = multi.getParameter("airConditioner");
		String refrigerator = multi.getParameter("refrigerator");
		String washingMachine = multi.getParameter("washingMachine");
		String dryer = multi.getParameter("dryer");
		String induction = multi.getParameter("induction");
		String gasRange = multi.getParameter("gasRange");
		String desk = multi.getParameter("desk");
		String bookshelf = multi.getParameter("bookshelf");
		String bed = multi.getParameter("bed");
		String closet = multi.getParameter("closet");
		String dishWasher = multi.getParameter("dishWasher");
		String shoeCloset = multi.getParameter("shoeCloset");
		if (television == null) television = "n";
		if (airConditioner == null) airConditioner = "n";
		if (refrigerator == null) refrigerator = "n";
		if (washingMachine == null) washingMachine = "n";
		if (dryer == null) dryer = "n";
		if (induction == null) induction = "n";
		if (gasRange == null) gasRange = "n";
		if (desk == null) desk = "n";
		if (bookshelf == null) bookshelf = "n";
		if (bed == null) bed = "n";
		if (closet == null) closet = "n";
		if (dishWasher == null) dishWasher = "n";
		if (shoeCloset == null) shoeCloset = "n";
		
		
		//주차
		String parkingStatus = multi.getParameter("parkingStatus");
		String numParkSpace = multi.getParameter("numParkSpace");
		if (parkingStatus.equals("n")) {
			numParkSpace = "0";
		}
		
		
		
		//구조 정보
		String selectMainUse = multi.getParameter("selectMainUse");
		String selectRoomType = multi.getParameter("selectRoomType");
		String selectHeatingType = multi.getParameter("selectHeatingType");
		String selectDirection = multi.getParameter("selectDirection");
		String numRoom = multi.getParameter("numRoom");
		String numToilets = multi.getParameter("numToilets");
		String numBalcony = multi.getParameter("numBalcony");
		String buildingFloor = multi.getParameter("buildingFloor");
		String theFloor = multi.getParameter("theFloor");
		String dedicatedArea = multi.getParameter("dedicatedArea") + "㎡";
		String supplyArea = multi.getParameter("supplyArea") + "㎡";
		String elevatorStatus = multi.getParameter("elevatorStatus");
		String built = multi.getParameter("built");
		if (elevatorStatus == null) elevatorStatus = "n";
		
		
		//집주인
		String ownerName = multi.getParameter("ownerName");
		String ownerSsn = multi.getParameter("ownerSsn");
		String ownerAddress = multi.getParameter("ownerAddress");
		String ownerTel = multi.getParameter("ownerTel1") + "-" + multi.getParameter("ownerTel2") + "-" + multi.getParameter("ownerTel3");
		
		//집주인 - 대리인
		String deputyName = multi.getParameter("deputyName");
		String deputySsn = multi.getParameter("deputySsn");
		String deputyAddress = multi.getParameter("deputyAddress");
		
		//x,y 좌표
		String coordinateX = multi.getParameter("coordinateX");
		String coordinateY = multi.getParameter("coordinateY");
		
		BrokerRealEstateDAO dao = new BrokerRealEstateDAO();
		
		BrokerRealEstateDTO dto = new BrokerRealEstateDTO();
		
		//집주인 - 대리인
		dto.setDeputyAddress(deputyAddress);
		dto.setDeputyName(deputyName);
		dto.setDeputySsn(deputySsn);
		
		dao.setDeputy(dto);
		
		
		//집주인
		dto.setOwnerName(ownerName);
		dto.setOwnerSsn(ownerSsn);
		dto.setOwnerAddress(ownerAddress);
		dto.setOwnerTel(ownerTel);
		
		String maxSeq = dao.getDeputySeq();
		
		dao.setOwner(dto, maxSeq);
		
		maxSeq = dao.getOwnerSeq();
		
		//매물정보
		String id = (String)session.getAttribute("auth");
		dto.setId(id);
		dto.setOwnerSeq(maxSeq);
		dto.setBuildingTypeSeq(selectBuilding);
		dto.setContractSeq(selectContract);
		dto.setRealEstateAddr(realEstateAddr);
		dto.setBrokerReward(brokerReward);
		dto.setPrice(price);
		dto.setIntroduce(introduce);
		dto.setMoveInDate(moveInDate);
		dto.setPetOk(petOk);
		dto.setLoanOk(loanOk);
		dto.setCoordinateX(coordinateX);
		dto.setCoordinateY(coordinateY);
		
		dao.setRealEstate(dto);
		
		maxSeq = dao.getRealEstate();
		
		//보증금
		if (deposit != null && !deposit.equals("")) {
			dto.setDeposit(deposit);
			dao.setDeposit(dto, maxSeq);
		}
		
		//구조
		dto.setRoomTypeSeq(selectRoomType);
		dto.setMainUseSeq(selectMainUse);
		dto.setNumRoom(numRoom);
		dto.setNumToilets(numToilets);
		dto.setNumBalcony(numBalcony);
		dto.setHeatingType(selectHeatingType);
		dto.setDirection(selectDirection);
		dto.setBuilt(built);
		dto.setBuildingFloor(buildingFloor);
		dto.setTheFloor(theFloor);
		dto.setDedicatedArea(dedicatedArea);
		dto.setSupplyArea(supplyArea);
		dto.setElevatorStatus(elevatorStatus);
		
		dao.setStructure(dto, maxSeq);
		
		//옵션정보
		dto.setTelevision(television);
		dto.setAirConditioner(airConditioner);
		dto.setRefrigerator(refrigerator);
		dto.setWashingMachine(washingMachine);
		dto.setDryer(dryer);
		dto.setInduction(induction);
		dto.setGasRange(gasRange);
		dto.setDesk(desk);
		dto.setBookshelf(bookshelf);
		dto.setBed(bed);
		dto.setCloset(closet);
		dto.setDishWasher(dishWasher);
		dto.setShoeCloset(shoeCloset);
		
		dao.setOption(dto, maxSeq);
		
		//관리비
		dto.setAmount(amount);
		dto.setElectricityBill(electricityBill);
		dto.setGasBill(gasBill);
		dto.setWaterBill(waterBill);
		dto.setTelevisionBill(televisionBill);
		dto.setInternetBill(internetBill);
		dto.setParkingBill(parkingBill);
		
		dao.setManagementFee(dto, maxSeq);
		
		//사진
		for (String name : filename) {
			dao.setRealEstatePicture(name, maxSeq);
		}
		
		//주차
		dto.setParkingStatus(parkingStatus);
		dto.setNumParkSpace(numParkSpace);
		
		
		int result = dao.setParking(dto, maxSeq);
		
		if (result == 1) {
			resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();

            writer.println("<html>");
            writer.println("<body>");
            writer.println("<script>");
            writer.println("alert('매물 등록에 성공하셨습니다.');");
            writer.println("location.href='/house/brokermain/brokerMain'");
            writer.println("</script>");
            writer.println("</body>");
            writer.println("</html>");

            writer.close();
		} else {
			resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();

            writer.println("<html>");
            writer.println("<body>");
            writer.println("<script>");
            writer.println("alert('매물 등록에 실패하셨습니다.');");
            writer.println("history.back();");
            writer.println("</script>");
            writer.println("</body>");
            writer.println("</html>");

            writer.close();
		}
		
		
		
	
	}

}
