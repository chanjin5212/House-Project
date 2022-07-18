<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
        <div>
          <img
            src="/house/asset/images/brokerlogo.png"
            alt=""
            style="width: 125px"
            onclick="location.href='/house/brokermain/brokerMain';"
          />
          <nav>
            <ul>
              <li><a href="/house/brokermain/brokerMain">홈</a></li>
              <li><a href="">후기 게시판</a></li>
              <li><a href="">알림</a></li>
            </ul>
          </nav>
        </div>
        
        
	        <c:if test="${empty auth || lv=='1'}">	
			<div>
		        <button class="button blue">
		          회원가입
		        </button>
		        <button class="button blue" onclick="location.href='/house/domain/sign/login'">로그인</button>
	      	</div>
	      	</c:if>
        
	        <c:if test="${not empty auth && lv=='2'}">
			<div class="dropdown">
				<button class="dropbtn">
					<span>${name}님</span> <i class="fa-solid fa-caret-down"></i>
				</button>
				<div class="dropdown-content">
					<a href="#">마이페이지</a> <a href="/house/domain/sign/logout">로그아웃</a>
				</div>
			</div>
			</c:if>
        
</header>





