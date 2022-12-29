<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>

<!--지도 The Modal -->
<div class="modal fade" id="myModal">
   <div class="modal-dialog modal-lg modal-dialog-centered">
      <div class="modal-content">

         <!-- Modal Header -->
         <div class="modal-header">
            <h4 class="modal-title">&nbsp;&nbsp;&nbsp;내 위치 등록</h4>
            <button type="button" class="modal_btn" data-dismiss="modal"  onclick="myModalClose()">&times;</button>
         </div>

         <!-- Modal body -->
         <div class="map-modal-body">
            <div class="map_wrap">
               <div id="map"
                  style="left: 295px; width: 500px; height: 400px; position: relative; overflow: hidden;"></div>
               
                  <div id="clickLatlng" style="left:10px;"></div> 
                  <input type="hidden" name="modal_address" id="modal_address">

               <div id="menu_wrap" class="bg_white">
                  <div class="option">
                     <div>
                        <form onsubmit="searchPlaces(); return false;">
                           주소 : <input type="text" value="" id="keyword" size="17">
                           <button type="submit" style="position: inherit;">검색하기</button>
                        </form>
                     </div>
                  </div>
                  <hr>
                  <ul id="placesList"></ul>
                  <div id="pagination"></div>
               </div>
            </div>

            <script type="text/javascript"
               src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17ddeba899945d357cf074efe3300b31&libraries=services"></script>
            <script>
               // 마커를 담을 배열입니다
               var markers = [];
               
               var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                   mapOption = {
                       center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                       level: 2 // 지도의 확대 레벨
                   };  
               
               // 지도를 생성합니다    
               var map = new kakao.maps.Map(mapContainer, mapOption); 
               
               // 장소 검색 객체를 생성합니다
               var ps = new kakao.maps.services.Places();  
               
               // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
               var infowindow = new kakao.maps.InfoWindow({zIndex:1});
               
               // 키워드로 장소를 검색합니다
               searchPlaces();
               
               function setCenter() {            
                   // 이동할 위도 경도 위치를 생성합니다 
                   var moveLatLon = new kakao.maps.LatLng(37.566826, 126.9786567);
                   
                   // 지도 중심을 이동 시킵니다
                   map.setCenter(moveLatLon);
               }
               
               // 키워드 검색을 요청하는 함수입니다
               function searchPlaces() {
                  //alert(1)
                   var keyword = document.getElementById('keyword').value;
               
                   /* if (!keyword.replace(/^\s+|\s+$/g, '')) {
                       alert('키워드를 입력해주세요!');
                       return false;
                   } */
               
                   // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
                   ps.keywordSearch( keyword, placesSearchCB); 
               }
               
               // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
               function placesSearchCB(data, status, pagination) {
                   if (status === kakao.maps.services.Status.OK) {
               
                       // 정상적으로 검색이 완료됐으면
                       // 검색 목록과 마커를 표출합니다
                       displayPlaces(data);
               
                       // 페이지 번호를 표출합니다
                       displayPagination(pagination);
               
                   } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
               
                       alert('검색 결과가 존재하지 않습니다.');
                       return;
               
                   } else if (status === kakao.maps.services.Status.ERROR) {
               
                       alert('검색 결과 중 오류가 발생했습니다.');
                       return;
               
                   }
               }
               
               // 검색 결과 목록과 마커를 표출하는 함수입니다
               function displayPlaces(places) {
                  
                   var listEl = document.getElementById('placesList'), 
                   menuEl = document.getElementById('menu_wrap'),
                   fragment = document.createDocumentFragment(), 
                   bounds = new kakao.maps.LatLngBounds(), 
                   listStr = '';
                   
                   // 검색 결과 목록에 추가된 항목들을 제거합니다
                   removeAllChildNods(listEl);
               
                   // 지도에 표시되고 있는 마커를 제거합니다
                   removeMarker();
                   for ( var i=0; i<places.length; i++ ) {
                       // 마커를 생성하고 지도에 표시합니다
                       var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                           marker = addMarker(placePosition, i), 
                           itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
               
                       // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                       // LatLngBounds 객체에 좌표를 추가합니다
                       bounds.extend(placePosition);
               
                       // 마커와 검색결과 항목에 mouseover 했을때
                       // 해당 장소에 인포윈도우에 장소명을 표시합니다
                       // mouseout 했을 때는 인포윈도우를 닫습니다
                       (function(marker, title,road) {
                          
                          kakao.maps.event.addListener(marker, 'click', function() {
                               
                               var message = '클릭한 장소는 ' + road + ' 입니다 ';
                            
                            var resultDiv = document.getElementById('clickLatlng'); 
                            resultDiv.innerHTML = message;
                            
                            document.getElementById('myaddress').value = road;
                           });
                          
                       })(marker, places[i].place_name,places[i].road_address_name);
               
                       fragment.appendChild(itemEl);
                   }
               
                   // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
                   listEl.appendChild(fragment);
                   menuEl.scrollTop = 0;
               
                   // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                   map.setBounds(bounds);
               }
               
               function add(place,address){
                  var check = confirm(address+" 등록하시겠습니까?")
                  
                  if(check==true){
                     var message = '선택한 장소는 ' + address + ' 입니다 ';
                      
                      var resultDiv = document.getElementById('clickLatlng'); 
                      resultDiv.innerHTML = message;
                      
                      document.getElementById('modal_address').value = address;
                      
                      document.getElementById('myposition').value = place;
                      document.getElementById('myaddress').value = address;
                  }
               }
               
               
               // 검색결과 항목을 Element로 반환하는 함수입니다
               function getListItem(index, places) {
               
                   var el = document.createElement('li'),
                   itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                               '<div class="info">' +
                               '   <h5>' + places.place_name + '</h5>';
                  
                   if (places.road_address_name) {
                       itemStr += '    <span>' + places.road_address_name + '</span>' +
                                   '   <span class="jibun gray">' +  places.address_name  + '</span>';
                   } else {
                       itemStr += '    <span>' +  places.address_name  + '</span>'; 
                   }
                                
                     itemStr += '  <span class="tel">' + places.phone  + '</span>';
                               
                     itemStr += '  <input type="button" value="추가하기" onclick="add(\''+places.place_name+'\',\''+places.road_address_name+'\')"></div>';  
               
                   el.innerHTML = itemStr;
                   el.className = 'item';
               
                   return el;
               }
               
               // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
               function addMarker(position, idx, title) {
                   var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                       imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
                       imgOptions =  {
                           spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                           spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                           offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                       },
                       markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                           marker = new kakao.maps.Marker({
                           position: position, // 마커의 위치
                           image: markerImage 
                       });
               
                   marker.setMap(map); // 지도 위에 마커를 표출합니다
                   markers.push(marker);  // 배열에 생성된 마커를 추가합니다
               
                   return marker;
               }
               
               // 지도 위에 표시되고 있는 마커를 모두 제거합니다
               function removeMarker() {
                   for ( var i = 0; i < markers.length; i++ ) {
                       markers[i].setMap(null);
                   }   
                   markers = [];
               }
               
               // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
               function displayPagination(pagination) {
                   var paginationEl = document.getElementById('pagination'),
                       fragment = document.createDocumentFragment(),
                       i; 
               
                   // 기존에 추가된 페이지번호를 삭제합니다
                   while (paginationEl.hasChildNodes()) {
                       paginationEl.removeChild (paginationEl.lastChild);
                   }
               
                   for (i=1; i<=pagination.last; i++) {
                       var el = document.createElement('a');
                       el.href = "#";
                       el.innerHTML = i;
               
                       if (i===pagination.current) {
                           el.className = 'on';
                       } else {
                           el.onclick = (function(i) {
                               return function() {
                                   pagination.gotoPage(i);
                               }
                           })(i);
                       }
               
                       fragment.appendChild(el);
                   }
                   paginationEl.appendChild(fragment);
               }
               
               // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
               // 인포윈도우에 장소명을 표시합니다
               function displayInfowindow(marker, title) {
                  //alert('title : '+title)
                   var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
               
                   infowindow.setContent(content);
                   infowindow.open(map, marker);
               }
               
                // 검색결과 목록의 자식 Element를 제거하는 함수입니다
               function removeAllChildNods(el) {   
                   while (el.hasChildNodes()) {
                       el.removeChild (el.lastChild);
                   }
               }
                /* =================직접 장소 지정================= */
                // 지도를 클릭한 위치에 표출할 마커입니다
                  var marker = new kakao.maps.Marker({ 
                      // 지도 중심좌표에 마커를 생성합니다 
                      position: map.getCenter() 
                  }); 
                  // 지도에 마커를 표시합니다
                  marker.setMap(map);
                  
                  // 지도에 클릭 이벤트를 등록합니다
                  // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
                  kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
                      
                     
                     //clickLatlng 초기화
                     document.getElementById('myposition').value=null;
                     document.getElementById('myaddress').value=null;
                     
                     removeAllChildNods(document.getElementById('clickLatlng'));
                     
                      // 클릭한 위도, 경도 정보를 가져옵니다 
                      var latlng = mouseEvent.latLng; 
                      
                      // 마커 위치를 클릭한 위치로 옮깁니다
                      marker.setPosition(latlng);
                      
                      /* var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
                      message += '경도는 ' + latlng.getLng() + ' 입니다';
                      
                      var resultDiv = document.getElementById('clickLatlng'); 
                      resultDiv.innerHTML = message; */
                      
                  });
               </script>
         </div>

         <!-- Modal footer -->
         <div class="modal-footer">
            <button type="button" class="modal_btn" data-dismiss="modal">닫기</button>
            <button type="button" class="modal_btn" data-dismiss="modal" name="ok">확인</button>
         </div>

      </div>
   </div>
</div>


<!-- 지도 끝 -->