package net.xieee.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.xieee.web.bean.Cartoon;
import net.xieee.web.bean.Params;
import net.xieee.web.bean.Picture;

public class PictureServiceImpl {
	
	
	
	public boolean checkHasPicture(String pictureName) {
		String sql = "select count(1) as count from picture where picture_name=?";
		Object[] params = { pictureName };
		List list = DB.excuteQuery(sql, params,DB.getScoreConnection());
		int result = 0;
		if(!StringUtil.isNull(list)){
			System.out.println(((Map)list.get(0)).get("count"));
			result = StringUtil.stringToInt(((Map)list.get(0)).get("count")+"");
		}
		if (result != 0) {
			return true;
		}
		return false;
	}

	public int savePicture(Picture picture) {
		if (!StringUtil.isNull(picture)) {
			String sql = "insert into picture(picture_name,local_url,title,type,spark_url,author,parent_picture,key_word,width,height,inter_url,detail,inter_url_small,local_url_small) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			Object[] params = { picture.getPicture_name(),
					picture.getLocal_url(), picture.getTitle(),
					picture.getType(), picture.getSpark_url(),
					picture.getAuthor(), picture.getParent_picture(),
					picture.getKey_word(), picture.getWidth(),
					picture.getHeight(), picture.getInter_url(),
					picture.getDetail(),picture.getInter_url_samll(),picture.getLocal_url_small() };
			return DB.excuteUpdate(sql, params,DB.getScoreConnection());
		}
		return 0;
	}

	public int checkURL(String url) {
		if (!StringUtil.isNull(url)) {
			String sql = "select count(1) as count from pageurl where url=? and is_delete=?";
			Object[] params = { url, 0 };
			List list = DB.excuteQuery(sql, params,DB.getScoreConnection());
			if(!StringUtil.isNull(list)){
				return  StringUtil.stringToInt(((Map)list.get(0)).get("count")+"");
			}
		}

		return 0;
	}

	public int savePictureURL(String pageUrl, String pageTitle) {
		if (!StringUtil.isNull(pageUrl)) {
			String saveSql = "insert into pageurl(url,title) values(?,?)";
			Object[] params = { pageUrl, pageTitle };
			return DB.excuteUpdate(saveSql, params,DB.getScoreConnection());
		}
		return 0;
	}

	public int updateIsDelete(int pageUrlId) {
		String sql = "update pageurl set is_delete=? where id=?";
		return DB.excuteUpdate(sql, new Object[] { 1, pageUrlId },DB.getScoreConnection());
	}

	public int checkSpiderUrl(String url) {
		if (!StringUtil.isNull(url)) {
			String sql = "select count(1) as count from pageurl where url=?";
			Object[] params = { url };
			List list = DB.excuteQuery(sql, params,DB.getScoreConnection());;
			if(!StringUtil.isNull(list)){
				return StringUtil.stringToInt(((Map)list.get(0)).get("count")+"");
			}
		}
		return 0;
	}

	public boolean checkCartoonImg(String imgUrl) {
		if (!StringUtil.isNull(imgUrl)) {
			String sql = "select count(1) as count from cartoon where cartoon_inter_url =?";
			Object[] params = { imgUrl };
			List list = DB.excuteQuery(sql, params,DB.getScoreConnection());
			int tmp = 0;
			if(!StringUtil.isNull(list)){
				tmp = StringUtil.stringToInt(((Map)list.get(0)).get("count")+"");
			}
			if (tmp > 0) {
				return true;
			}
		}
		return false;

	}

	public int saveCartoon(Cartoon cartoon) {
		String sql = "insert into cartoon(cartoon_name,cartoon_title,cartoon_user_name,cartoon_detail,cartoon_image_name,cartoon_inter_url,image_height,image_width,cartoon_local_url,cartoon_parent_url) values(?,?,?,?,?,?,?,?,?,?)";
		Object[] params ={cartoon.getCartoon_name(),cartoon.getCartoon_title(),cartoon.getCartoon_user_name(),cartoon.getCartoon_detail(),cartoon.getCartoon_image_name(),cartoon.getCartoon_inter_url(),cartoon.getImage_height(),cartoon.getImage_width(),cartoon.getCartoon_local_url(),cartoon.getCartoon_parent_url()};
		return DB.excuteUpdate(sql, params,DB.getScoreConnection());
	}

	
	public int saveGadReply(Picture pPicture) {
		String checkSql = "select count(1) from picture where title =? and detail=? ";
		Object[] params = {pPicture.getTitle(),pPicture.getDetail()};
		int checkNumber = checkGadReply(pPicture.getTitle(),pPicture.getDetail());
		if(checkNumber==0){
			checkSql  = "insert into picture(title,detail) values(?,?)";
			return DB.excuteUpdate(checkSql, params,DB.getScoreConnection());
		}
		return 0;
	}

	
	public int checkGadReply(String title,String detail) {
		String checkSql = "select count(1) as count from picture where title =? and detail=? ";
		Object[] params = {title,detail};
		List list = DB.excuteQuery(checkSql, params,DB.getScoreConnection());
		if(!StringUtil.isNull(list)){
			return StringUtil.stringToInt(((Map)list.get(0)).get("count")+"");
		}
		return 0;
	}
	
	
	public Params getParamsById(Integer id){
		if(StringUtil.isNull(id)){
			return null;
		}
		String sql = "select id,param,param_value,descript from params where id=?";
		Object[] params = {id};
		List<HashMap<String, Object>> lists = DB.excuteQuery(sql, params, DB.getScoreConnection());
		if(!lists.isEmpty()){
			HashMap map = lists.get(0);
			Params param = new Params();
			param.setDescript((String)map.get("descript"));
			param.setId((Integer)map.get("id"));
			param.setParamValue((String)map.get("param_value"));
			param.setParam((String)map.get("param"));
			return param;
		}
		return null;
	}
	
	public int saveParams(Integer paramValue,Integer id){
		if(StringUtil.isNull(paramValue) || StringUtil.isNull(id)){
			return 0;
		}
		String sql = "update params set param_value=? where id=?";
		Object[] params = {paramValue,id};
		return DB.excuteUpdate(sql, params, DB.getScoreConnection());
	}
	
	
	public int update(String sql,Object[] params){
		return DB.excuteUpdate(sql, params, DB.getScoreConnection()); 
	}
	
	public int save(String sql,Object[] params){
		return DB.excuteUpdate(sql, params, DB.getScoreConnection());
	}
	
	public List<HashMap<String, Object>> getList(String sql,Object[] params){
		return DB.excuteQuery(sql, params, DB.getScoreConnection());
	}

	
	public int groupGif(int tagId,String title) {
		Integer temp = StringUtil.random();
		String sql = "select id,local_url,local_url_small,title from picture where is_delete=1 and key_word=? and parent_picture is null limit "+temp+"";
		Object[] params = {tagId};
		List list = getList(sql, params);
		Map map = null;
		String insertParent = "insert into parent_picture(parent_picture_name,detail,picture_url,catalog_id,picture_count) values(?,?,?,?,?)";
		if(!list.isEmpty()){
			map = (Map)list.get(0);
			int parentId = 0;
			if(!StringUtil.isNull(map.get("local_url_small")) && !StringUtil.isNull(map.get("title"))){
				Object[] param  = {title,(String)map.get("title"),(String)map.get("local_url_small"),tagId,temp};
				parentId = save(insertParent, param);
			}else if(StringUtil.isNull(map.get("local_url_small")) && !StringUtil.isNull(map.get("title"))) {
				Object[] param  = {title,(String)map.get("title"),(String)map.get("local_url"),tagId,temp};
				parentId = save(insertParent, param);
			}else if(StringUtil.isNull(map.get("local_url_small")) && StringUtil.isNull(map.get("title"))) {
				Object[] param  = {title,(String)map.get("detail"),(String)map.get("local_url"),tagId,temp};
				parentId = save(insertParent, param);
			}else {
				Object[] param  = {title,(String)map.get("detail"),(String)map.get("local_url_small"),tagId,temp};
				parentId = save(insertParent, param);
			}
			
			
			// 保存好了，那么就修改picture表里面的catalog_id
			if(!StringUtil.isNull(parentId)){
				String ids = "";
				for (int i = 0; i < list.size(); i++) {
					map = (Map) list.get(i);
					ids+=map.get("id")+",";
				}
				Object[] pObjects = {parentId};
				String update = "update picture set parent_picture=? where id in ("+ids.substring(0,ids.lastIndexOf(","))+")";
				return update(update, pObjects);
			}
		}
		return 0;
	}
}
