package com.su.dao;

import java.util.List;

import com.su.model.Page;

public interface EntityDao {
	
	public Object save(final Object model);
	public void delete(final Object model);
	public void update(final Object model);
	public List<Object> createQuery(final String queryString);
	public void updateExecute(String sql);
	public List<Object> createQuery(final String queryString,int page,int pageSize);
	public List<Object> queryByField(String queryString, String[] paramNames, Object[] values,Page page);
	
	
	public List<Object> queryIndexList(Class clazz,String tablename,String group,String order,int num);
	public Object query(final Class clazz,final int id);
	public Object query(final String query);
	public Object queryByField(final Class clazz,final String key,final Object value);
	public List<Object> queryListByField(final Class clazz,final String key,final Object value);
	public Integer getCountByField(String queryString, String[] paramNames, Object[] values);
	public List<Object> queryByField(String queryString, String[] paramNames, Object[] values);
	public List<Object> queryCurrentList(Class clazz,String table,String start,String end,int num);
	public List<Object> queryRecentlyList(Class clazz,String table,String start,int num);
	public List<Object> queryHistoryList(Class clazz,String table,String end,int num);
	public List<Object> queryImageListByField(Class clazz, String string, Object review_id,String order);
	public List<Object> queryByField(String queryString, Page page);
}
