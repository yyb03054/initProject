/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.shop.sell.service;

import java.util.List;

/**
 * @Class Name : InitSellService.java
 * @Description : InitSellService Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public interface InitSellService {

	 /**
	    * 글을 등록한다.
	    * @param vo - 등록할 정보가 담긴 SellVO
	    * @return 등록 결과
	    * @exception Exception
	    */
	void insertProduct(SellVO vo) throws Exception;
	   
	   /**
	    * 이미지를 등록한다.
	    * @param vo - 등록할 정보가 담긴 SellVO
	    * @return 등록 결과
	    * @exception Exception
	    */
	   void insertImage(SellVO vo) throws Exception;
	   
	   /**
	    * 글을 등록한다.
	    * @param vo - 등록할 정보가 담긴 SellVO
	    * @return 등록 결과
	    * @exception Exception
	    */
	   void insertSell(SellVO vo) throws Exception;

	   void insertSale(SellVO vo) throws Exception;
	   
	   void insertShop(SellVO vo) throws Exception;
	   
	   void insertOrder(SellVO vo) throws Exception;
	   
	   /**
	    * 글을 수정한다.
	    * @param vo - 수정할 정보가 담긴 SellVO
	    * @return void형
	    * @exception Exception
	    */
	   void updateSell(SellVO vo) throws Exception;
	   
	   void updateImgY(SellVO vo) throws Exception;
	   
	   void updateImgN(SellVO vo) throws Exception;
	   
	   void updateSale(SellVO vo) throws Exception;
	   
	   void updateShop(SellVO vo) throws Exception;
	   
	   /**
	    * 글을 수정한다.
	    * @param vo - 수정할 정보가 담긴 SellVO
	    * @return void형
	    * @exception Exception
	    */
	   void updateProduct(SellVO vo) throws Exception;

	   /**
	    * 글을 삭제한다.
	    * @param vo - 삭제할 정보가 담긴 SellVO
	    * @return void형
	    * @exception Exception
	    */
	   void deleteProduct(SellVO vo) throws Exception;
	   
	   /**
	    * 판매처를 삭제한다.
	    * @param vo - 삭제할 정보가 담긴 SellVO
	    * @return void형
	    * @exception Exception
	    */
	   void deleteSell(SellVO vo) throws Exception;
	   
	   /**
	    * 판매처를 삭제한다.
	    * @param vo - 삭제할 정보가 담긴 SellVO
	    * @return void형
	    * @exception Exception
	    */
	   void deleteImg(SellVO vo) throws Exception;
	   
	   void deleteSale(SellVO vo) throws Exception;
	   
	   void deleteShop(SellVO vo) throws Exception;

	   /**
	    * 글을 조회한다.
	    * @param vo - 조회할 정보가 담긴 SellVO
	    * @return 조회한 글
	    * @exception Exception
	    */
	   SellVO selectProduct(SellVO vo) throws Exception;
	   
	   /**
	    * 글을 조회한다.
	    * @param vo - 조회할 정보가 담긴 SellVO
	    * @return 조회한 글
	    * @exception Exception
	    */
	   SellVO selectSell(SellVO vo) throws Exception;
	   
	   SellVO selectOrder(SellVO vo) throws Exception;
	   
	   SellVO selectShopDetail(SellVO vo) throws Exception;
	   
	   SellVO selectSaleNum(SellVO vo) throws Exception;

	   /**
	    * 글 목록을 조회한다.
	    * @param searchVO - 조회할 정보가 담긴 VO
	    * @return 글 목록
	    * @exception Exception
	    */
	   List<?> selectProductList(SellDefaultVO searchVO) throws Exception;
	   
	   List<?> selectProductListUser(SellDefaultVO searchVO) throws Exception;

	   /**
	    * 글 목록을 조회한다.
	    * @param searchVO - 조회할 정보가 담긴 VO
	    * @return 글 목록
	    * @exception Exception
	    */
	   List<?> selectSellList(SellDefaultVO searchVO) throws Exception;
	   
	   /**
	    * 글 목록을 조회한다.
	    * @param searchVO - 조회할 정보가 담긴 VO
	    * @return 글 목록
	    * @exception Exception
	    */
	   List<?> selectProductListImg(SellDefaultVO searchVO) throws Exception;
	   
	   List<?> selectShopList(SellDefaultVO searchVO) throws Exception;

	   /**
	    * 글 총 갯수를 조회한다.
	    * @param searchVO - 조회할 정보가 담긴 VO
	    * @return 글 총 갯수
	    * @exception
	    */
	   int selectSellListTotCnt(SellDefaultVO searchVO);
	   
	   int selectShopListTotCnt(SellDefaultVO searchVO);
	   
	   List<?> selectPeriod(SellDefaultVO searchVO) throws Exception;
	   
	   /**
	    * 글 총 갯수를 조회한다.
	    * @param searchVO - 조회할 정보가 담긴 VO
	    * @return 글 총 갯수
	    * @exception
	    */
	   int selectProductListTotCnt(SellDefaultVO searchVO);
	   
	   int selectProductListUserTotCnt(SellDefaultVO searchVO);
	   
	   int selectOrderListTotCnt(SellDefaultVO searchVO);
	   
	   List<?> selectBrand(SellDefaultVO searchVO) throws Exception;
	   
	   List<?> selectImage(SellDefaultVO searchVO) throws Exception;
	   
	   List<?> selectDelivery(SellDefaultVO searchVO) throws Exception;
	   
	   List<?> selectShop(SellDefaultVO searchVO) throws Exception;
	   
	   List<?> selectSale(SellDefaultVO searchVO) throws Exception;
	   
	   List<?> selectSaleMax(SellDefaultVO searchVO) throws Exception;

	   List<?> selectPrdMin(SellDefaultVO searchVO) throws Exception;
	   
	   List<?> selectMainImage(SellDefaultVO searchVO) throws Exception;
	   
	   List<?> selectOrderList(SellDefaultVO searchVO) throws Exception;
	   
	   List<?> selectReport(SellDefaultVO searchVO) throws Exception;
	   
	}