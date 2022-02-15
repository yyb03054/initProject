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
package egovframework.shop.sell.service.impl;

import java.util.List;

import egovframework.shop.sell.service.SellDefaultVO;
import egovframework.shop.sell.service.SellVO;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import org.springframework.stereotype.Repository;

/**
 * @Class Name : SellDAO.java
 * @Description : Sell DAO Class
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

@Repository("sellDAO")
public class SellDAO extends EgovAbstractDAO {

	/**
	    * 상품을 등록한다.
	    * @param vo - 등록할 정보가 담긴 SellVO
	    * @return 등록 결과
	    * @exception Exception
	    */
	   public void insertProduct(SellVO vo) throws Exception {
		   insert("sellDAO.insertProduct", vo);
	   }
	   
	   public void insertOrder(SellVO vo) throws Exception {
		   insert("sellDAO.insertOrder", vo);
	   }
	   
	   /**
	    * 이미지을 등록한다.
	    * @param vo - 등록할 정보가 담긴 SellVO
	    * @return 등록 결과
	    * @exception Exception
	    */
	   public void insertImage(SellVO vo) throws Exception {
		   insert("sellDAO.insertImage", vo);
	   }

	   /**
	    * 판매처을 등록한다.
	    * @param vo - 등록할 정보가 담긴 SellVO
	    * @return 등록 결과
	    * @exception Exception
	    */
	   public void insertSell(SellVO vo) throws Exception {
		   insert("sellDAO.insertSell", vo);
	   }
	   
	   public void insertSale(SellVO vo) throws Exception {
		   insert("sellDAO.insertSale", vo);
		   }
	   
	   public void insertShop(SellVO vo) throws Exception {
		   insert("sellDAO.insertShop", vo);
		   }

	   /**
	    * 상품을 수정한다.
	    * @param vo - 수정할 정보가 담긴 SellVO
	    * @return void형
	    * @exception Exception
	    */
	   public void updateProduct(SellVO vo) throws Exception {
	      update("sellDAO.updateProduct", vo);
	   }
	   
	   public void updateShop(SellVO vo) throws Exception {
		      update("sellDAO.updateShop", vo);
		   }
	   
	   /**
	    * 판매처을 수정한다.
	    * @param vo - 수정할 정보가 담긴 SellVO
	    * @return void형
	    * @exception Exception
	    */
	   public void updateSell(SellVO vo) throws Exception {
	      update("sellDAO.updateSell", vo);
	   }
	   
	   public void updateImgY(SellVO vo) throws Exception {
		      update("sellDAO.updateImgY", vo);
		   }
	   
	   public void updateImgN(SellVO vo) throws Exception {
		      update("sellDAO.updateImgN", vo);
		   }
	   public void updateSale(SellVO vo) throws Exception {
		      update("sellDAO.updateSale", vo);
		   }

	   /**
	    * 상품을 삭제한다.
	    * @param vo - 삭제할 정보가 담긴 SellVO
	    * @return void형
	    * @exception Exception
	    */
	   public void deleteProduct(SellVO vo) throws Exception {
	      delete("sellDAO.deleteProduct", vo);
	   }
	   
	   /**
	    * 판매처를 삭제한다.
	    * @param vo - 삭제할 정보가 담긴 SellVO
	    * @return void형
	    * @exception Exception
	    */
	   public void deleteSell(SellVO vo) throws Exception {
	      delete("sellDAO.deleteSell", vo);
	   }
	   
	   public void deleteSale(SellVO vo) throws Exception {
		      delete("sellDAO.deleteSale", vo);
		   }
		   
	   /**
	    * 판매처를 삭제한다.
	    * @param vo - 삭제할 정보가 담긴 SellVO
	    * @return void형
	    * @exception Exception
	    */
	   public void deleteImg(SellVO vo) throws Exception {
	      delete("sellDAO.deleteImg", vo);
	   }
	   
	   public void deleteShop(SellVO vo) throws Exception {
		      delete("sellDAO.deleteShop", vo);
		   }

	   /**
	    * 상품 수정화면을 조회한다.
	    * @param vo - 조회할 정보가 담긴 SellVO
	    * @return 조회한 글
	    * @exception Exception
	    */
	   public SellVO selectProduct(SellVO vo) throws Exception {
	      return (SellVO) select("sellDAO.selectProduct", vo);
	   }
	   
	   public SellVO selectOrder(SellVO vo) throws Exception {
		      return (SellVO) select("sellDAO.selectOrder", vo);
		   }
	   
	   /**
	    * 판매처 수정화면을 조회한다.
	    * @param vo - 조회할 정보가 담긴 SellVO
	    * @return 조회한 글
	    * @exception Exception
	    */
	   public SellVO selectSell(SellVO vo) throws Exception {
	      return (SellVO) select("sellDAO.selectSell", vo);
	   }
	   public SellVO selectShopDetail(SellVO vo) throws Exception {
		      return (SellVO) select("sellDAO.selectShopDetail", vo);
		   }
	   
	   public SellVO selectSaleNum(SellVO vo) throws Exception {
		      return (SellVO) select("sellDAO.selectSaleNum", vo);
		   }
	   
	   

	   /**
	    * 상품 목록을 조회한다.
	    * @param searchMap - 조회할 정보가 담긴 Map
	    * @return 글 목록
	    * @exception Exception
	    */
	   public List<?> selectProductList(SellDefaultVO searchVO) throws Exception {
	      return list("sellDAO.selectProductList", searchVO);
	   }
	   
	   public List<?> selectProductListUser(SellDefaultVO searchVO) throws Exception {
		      return list("sellDAO.selectProductListUser", searchVO);
		   }
	   
	   public List<?> selectReport(SellDefaultVO searchVO) throws Exception {
		      return list("sellDAO.selectReport", searchVO);
		   }
	   
	   public List<?> selectShopList(SellDefaultVO searchVO) throws Exception {
		      return list("sellDAO.selectShopList", searchVO);
		   }
	   
	   /**
	    * 판매처 목록을 조회한다.
	    * @param searchMap - 조회할 정보가 담긴 Map
	    * @return 글 목록
	    * @exception Exception
	    */
	   public List<?> selectSellList(SellDefaultVO searchVO) throws Exception {
	      return list("sellDAO.selectSellList", searchVO);
	   }

	   /**
	    * 상품 목록을 조회한다.(이미지없는)
	    * @param searchMap - 조회할 정보가 담긴 Map
	    * @return 글 목록
	    * @exception Exception
	    */
	   public List<?> selectProductListImg(SellDefaultVO searchVO) throws Exception {
	      return list("sellDAO.selectProductListImg", searchVO);
	   }
	   
	   /**
	    * 상품 총 갯수를 조회한다.
	    * @param searchMap - 조회할 정보가 담긴 Map
	    * @return 글 총 갯수
	    * @exception
	    */
	   public int selectSellListTotCnt(SellDefaultVO searchVO) {
	      return (Integer) select("sellDAO.selectSellListTotCnt", searchVO);
	   }
	   
	   public int selectOrderListTotCnt(SellDefaultVO searchVO) {
		      return (Integer) select("sellDAO.selectOrderListTotCnt", searchVO);
		   }
	   
	   public int selectShopListTotCnt(SellDefaultVO searchVO) {
		      return (Integer) select("sellDAO.selectShopListTotCnt", searchVO);
		   }
	   
	   /**
	    * 판매처 총 갯수를 조회한다.
	    * @param searchMap - 조회할 정보가 담긴 Map
	    * @return 글 총 갯수
	    * @exception
	    */
	   public int selectProductListTotCnt(SellDefaultVO searchVO) {
	      return (Integer) select("sellDAO.selectProductListTotCnt", searchVO);
	   }
	   
	   public int selectProductListUserTotCnt(SellDefaultVO searchVO) {
		      return (Integer) select("sellDAO.selectProductListUserTotCnt", searchVO);
		   }
	   
	   public List<?> selectPeriod (SellDefaultVO searchVO) throws Exception {
		      return list("sellDAO.selectPeriod", searchVO);
		   }
	   
	   public List<?> selectBrand (SellDefaultVO searchVO) throws Exception {
	      return list("sellDAO.selectBrand", searchVO);
	   }
	   
	   public List<?> selectDelivery (SellDefaultVO searchVO) throws Exception {
	      return list("sellDAO.selectDelivery", searchVO);
	   }
	   
	   public List<?> selectShop (SellDefaultVO searchVO) throws Exception {
	      return list("sellDAO.selectShop", searchVO);
	   }
	   
	   public List<?> selectImage (SellDefaultVO searchVO) throws Exception {
	      return list("sellDAO.selectImage", searchVO);
	   }
	   
	   public List<?> selectSale (SellDefaultVO searchVO) throws Exception {
		      return list("sellDAO.selectSale", searchVO);
	   }
	   
	   public List<?> selectSaleMax(SellDefaultVO searchVO) throws Exception {
		      return list("sellDAO.selectSaleMax", searchVO);
	   }
	   
	   public List<?> selectPrdMin(SellDefaultVO searchVO) throws Exception {
		      return list("sellDAO.selectPrdMin", searchVO);
	   }
	   
	   public List<?> selectMainImage(SellDefaultVO searchVO) throws Exception {
		      return list("sellDAO.selectMainImage", searchVO);
	   }
	   
	   public List<?> selectOrderList(SellDefaultVO searchVO) throws Exception {
		      return list("sellDAO.selectOrderList", searchVO);
	   }

	}