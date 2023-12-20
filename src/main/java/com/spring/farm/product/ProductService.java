package com.spring.farm.product;

import java.util.List;

public interface ProductService {
	//상품목록 조회
	public List<ProductVO> getProductList(ProductVO vo);
	
	//상품 상세 정보
	public ProductVO getProductDetail(ProductVO vo);
	
	public int countProduct(ProductVO vo);
	
	public int delSelProd(ProductVO vo);

	public void stop(ProductVO vo);
	
	public ProductVO upProdsel(ProductVO vo);

	public void insertProd(ProductVO vo);

	public void updateProd(ProductVO vo);
	
	public int delProduct(ProductVO vo);
	
	public int orderHistoryCnt(int pro_num);
	
	public ProductVO getFileName(ProductVO vo);

	public List<ProductVO> getProductListDESC();
}
