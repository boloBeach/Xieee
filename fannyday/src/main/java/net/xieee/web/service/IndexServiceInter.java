package net.xieee.web.service;

import java.util.List;

import net.xieee.util.Pager;
import net.xieee.web.bean.Catalog;
import net.xieee.web.bean.ParentPicture;

public interface IndexServiceInter extends BaseServiceInter {
	/**
	 * 通过parent_catalog_id获取list的菜单信息
	 * 
	 * @param parent_catalog_id
	 *            父类菜单的id值
	 * @return
	 */
	public List<Catalog> getCatalogByParentId(String parent_catalog_id);



	/**
	 * 通过catalog的ID 来获取对应的catalogId的所有的图片获取其他的信息
	 * 
	 * @param urlId
	 *            catalogId值
	 * @param pageSize
	 *            用户显示多少条记录
	 * @param types
	 *            类型，有按照时间类型，还有按照热度
	 * @return 返回一个list<parentPicture>
	 */
	public List<ParentPicture> getParentPictures(String urlId, Integer pageSize, Integer types);



	/**
	 * 获取18个随机的图片
	 * 
	 * @param urlId
	 *            菜单Id值
	 * @param type
	 *            类型，默认是按照热度来进行排序，有热度和时间
	 * @return
	 */
	public List randPicture(String urlId, String type,String currentPage);



	/**
	 * 获取标签 <method description>
	 *
	 * @return
	 */
	public List getTag();



	/**
	 * 随机生成12个搞笑的漫画进去 <method description>
	 *
	 * @return
	 */
	public List randCartoon();



	/**
	 * 获取最新的4条评论
	 * 
	 * @return java.util.List<Commont>
	 */
	public List getNewCommontList();



	/**
	 * 获取搞笑图片的子页面
	 * 
	 * @param parentId
	 *            子页面的父类id
	 * @param currentPage
	 *            每个parentId的子图片的张数
	 * @return
	 */
	public Pager getGifPicture(String parentId, String currentPage);



	/**
	 * 通过parentId来获取对应的gif个数
	 * 
	 * @param parentId
	 *            父类id值
	 * @return java.util.integer
	 */
	public int getRowsGif(String parentId);



	/**
	 * 获取分页的对象 <method description>
	 *
	 * @param parentId
	 *            分页的id值
	 * @param currentPages
	 *            分页，默认为0
	 * @return
	 */
	public Pager getIndexPictureDetail(String parentId, String currentPages, int rows);



	/**
	 * 获取每一条记录的行数 <method description>
	 *
	 * @param parentId
	 * @return
	 */
	public int getIndexPictureDetailRows(String parentId);



	/**
	 * 获取标题等等信息
	 * <method description>
	 *
	 * @param parentId
	 * @return
	 */
	public List getParentPictureById(String pParentId,String catalogId);
	
	/**
	 * 访问一次detail页面，就记录一次
	 * @param parent_picture_id
	 * @return
	 */
	public int saveSkimCount(String parent_picture_id);
	
	
	/**
	 * 获取12条最多浏览的detail
	 * @return
	 */
	public List getParentPictureTopSkim();

}