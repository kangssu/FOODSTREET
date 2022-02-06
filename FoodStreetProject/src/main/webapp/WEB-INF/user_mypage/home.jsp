<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="info_content_list">
	<div class="info_content_list_title">
		<h2>내가 신청한 맛집<span>${member.name}님께서 신청한 맛집 리스트 입니다.</span></h2>
	</div>
	<div class="info_content_list_title more_button_text">
		<a href="/mypage/request/list">
			<span>더보기<i class="fa fa-angle-right" aria-hidden="true"></i></span>
		</a>
	</div>
	<div class="info_content_all_table">
		<table class="info_list_table">
			<thead>
				<tr>
					<th width="5%">No</th>
					<th width="10%">신청자</th>
					<th width="15%">가게이름</th>
					<th width="10%">지점명</th>
					<th width="20%">주소</th>
					<th width="10%">신청일</th>
					<th width="10%">상태</th>
					<th width="20%">비고</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${list.size() == 0}">
						<tr>
							<td colspan="8">맛집 신청내역이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="r" items="${list}" varStatus="status" begin="0" end="4">
							<tr>
								<td>${status.count}</td>
								<td>${r.name}</td>
								<td>${r.food_store}</td>
								<td>${r.place_name}</td>
								<td>${r.address2}</td>
								<td><fmt:formatDate value="${r.reporting_date}" pattern="yyyy-MM-dd"/></td>
								<td>${r.state}</td>
								<td>
									<button type="button" class="request_view">확인</button>
									<button type="button" class="request_del" onclick="userRequestDelPopup(${r.num});">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</div>
<div class="info_content_list">
	<div class="info_content_list_title">
		<h2>내가 등록한 리뷰<span>${member.name}님께서 등록한 리뷰 리스트 입니다.</span></h2>
	</div>
	<div class="info_content_list_title more_button_text">
		<span>더보기<i class="fa fa-angle-right" aria-hidden="true"></i></span>
	</div>
	<div class="info_content_all_table">
		<table class="info_list_table">
			<thead>
				<tr>
					<th width="10%">No</th>
					<th width="20%">가게이름</th>
					<th width="10%">지점명</th>
					<th width="30%">내용</th>
					<th width="10%">작성일</th>
					<th width="20%">비고</th>
				</tr>
			</thead>
			<!-- <tr>
					<td colspan="5">맛집 신청내역이 없습니다.</td>
				</tr> -->
			<tbody>
				<tr>
					<td>1</td>
					<td>메드포갈릭</td>
					<td>강남점</td>
					<td>여기는 진짜 제가 추천하는 찐 맛집!!!</td>
					<td>2022.01.30</td>
					<td>
						<button type="button" class="request_view">수정</button>
						<button type="button" class="request_del">삭제</button>
					</td>
				</tr>
				<tr>
					<td>2</td>
					<td>메드포갈릭</td>
					<td>강남점</td>
					<td>여기는 진짜 제가 추천하는 찐 맛집!!!</td>
					<td>2022.01.30</td>
					<td>
						<button type="button" class="request_view">수정</button>
						<button type="button" class="request_del">삭제</button>
					</td>
				</tr>
				<tr>
					<td>3</td>
					<td>메드포갈릭</td>
					<td>강남점</td>
					<td>여기는 진짜 제가 추천하는 찐 맛집!!!</td>
					<td>2022.01.30</td>
					<td>
						<button type="button" class="request_view">수정</button>
						<button type="button" class="request_del">삭제</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<!-- 맛집신청 삭제 클릭하면 나오는 팝업! -->
<div id="u_r_popup" class="hide">
	<div class="content">
		<h3 class="popup_title"><i class="fa fa-bell-o" aria-hidden="true"></i>삭제 확인</h3>
		<p class="popup_text">
			해당 맛집 신청을 삭제하시겠습니까?<br>
			삭제하시면 다시 원복하실 수 없습니다.<br>
		</p>
		<span>※ 신중히 생각하시고 진행부탁드립니다.</span>	
		<input type="hidden" id="delnum">
		<input type="hidden" id="nowpage">
		<div class="popup_btn">
			<button type="button" id="btn_ok_del">삭제</button>
			<button type="button" id="btn_close" onclick="closeuserRequestPopup()" >취소</button>
		</div>
	</div>
</div>