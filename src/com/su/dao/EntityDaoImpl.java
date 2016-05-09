package com.su.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.su.model.Page;


public class EntityDaoImpl extends HibernateDaoSupport implements EntityDao {
	@SuppressWarnings("unchecked")
	public List<Object> createQuery(final String queryString) {
		return (List<Object>) getHibernateTemplate().execute(new HibernateCallback<Object>() {
			public Object doInHibernate(org.hibernate.Session session) throws org.hibernate.HibernateException {
				Query query = session.createQuery(queryString);
				List<Object> rows = query.list();
				return rows;
			}
		});
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<Object> createQuery(String queryString, int page, int pageSize) {
		// TODO Auto-generated method stub
		return (List<Object>) getHibernateTemplate().execute(new HibernateCallback<Object>() {
			public Object doInHibernate(org.hibernate.Session session) throws org.hibernate.HibernateException {
				Query query = session.createQuery(queryString);
				
				query.setFirstResult((page-1)*pageSize);
				query.setMaxResults(pageSize);
				List<Object> rows = query.list();
				return rows;
			}
		});
	}
	
	public Object save(final Object model) {
		return getHibernateTemplate().execute(new HibernateCallback<Object>() {
			public Object doInHibernate(org.hibernate.Session session) throws org.hibernate.HibernateException {
				session.save(model);
				return null;
			}
		});
	}

	public void update(final Object model) {
		getHibernateTemplate().execute(new HibernateCallback<Object>() {
			public Object doInHibernate(org.hibernate.Session session) throws org.hibernate.HibernateException {
				session.update(model);
				return null;
			}
		});
	}

	public void delete(final Object model) {
		getHibernateTemplate().execute(new HibernateCallback<Object>() {
			public Object doInHibernate(org.hibernate.Session session) throws org.hibernate.HibernateException {
				session.delete(model);
				return null;
			}
		});
	}

	public Object query(final String queryString) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().execute(new HibernateCallback<Object>() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				// TODO Auto-generated method stub
				Query query = session.createQuery(queryString);
				return query.uniqueResult();
			}
		});
	}

	@Override
	public Object query(@SuppressWarnings("rawtypes") Class clazz, int id) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().execute(new HibernateCallback<Object>() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				// TODO Auto-generated method stub
				return session.get(clazz, id);
			}
		});
	}
	
	@Override
	public Object queryByField(@SuppressWarnings("rawtypes") Class clazz, String key, Object value) {
		// TODO Auto-generated method stub
		Object object = null;
		String sql = "";
		if (value instanceof String) {
			sql = "from " + clazz.getName() + " as vo where vo." + key + " = '" + value + "'";
		} else {
			sql = "from " + clazz.getName() + " as vo where vo." + key + " = '" + String.valueOf(value) + "'";
		}
		@SuppressWarnings("unchecked")
		List<Object> list = getHibernateTemplate().find(sql);
		if (list.size() > 0) {
			object = list.get(0);
		}
		return object;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> queryListByField(Class clazz, String key, Object value) {
		// TODO Auto-generated method stub
		return (List<Object>) getHibernateTemplate().execute(new HibernateCallback<Object>() {
			public Object doInHibernate(org.hibernate.Session session) throws org.hibernate.HibernateException {
				String sql = "";
				if (value instanceof String) {
					sql = "from " + clazz.getName() + " as vo where vo." + key + " = '" + value + "'";
				}else {
					sql = "from " + clazz.getName() + " as vo where vo." + key + " = '" + String.valueOf(value) + "'";
				}
				return getHibernateTemplate().find(sql);
			}
		});
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> queryImageListByField(Class clazz, String key, Object value,String order) {
		// TODO Auto-generated method stub
		return (List<Object>) getHibernateTemplate().execute(new HibernateCallback<Object>() {
			public Object doInHibernate(org.hibernate.Session session) throws org.hibernate.HibernateException {
				String sql = "";
				if (value instanceof String) {
					sql = "from " + clazz.getName() + " as vo where vo." + key + " = '" + value + "' order by vo."+order+" desc";
				}else {
					sql = "from " + clazz.getName() + " as vo where vo." + key + " = '" + String.valueOf(value) + "' order by vo."+order+" desc";
				}
				
				return getHibernateTemplate().find(sql);
			}
		});
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> queryByField(String queryString, String[] paramNames, Object[] values) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().findByNamedParam(queryString, paramNames, values);
	}
	
	public Integer getCountByField(String queryString, String[] paramNames, Object[] values){
		
		return getHibernateTemplate().findByNamedParam(queryString, paramNames, values).size();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> queryByField(String queryString, Page page) {
		// TODO Auto-generated method stub
		return (List<Object>) getHibernateTemplate().execute(new HibernateCallback<Object>() {
			public Object doInHibernate(org.hibernate.Session session) throws org.hibernate.HibernateException {
				Query query = session.createQuery(queryString);
				
				query.setFirstResult(page.getBeginIndex());//设置起点start
				
				query.setMaxResults(page.getEveryPage());//设置每页显示items
				
				List<Object> rows = query.list();
				return rows;
			}
		});
	}
	@SuppressWarnings("unchecked")
	public List<Object> queryByField(String queryString, String[] paramNames, Object[] values,Page page) {
		
		return (List<Object>) getHibernateTemplate().execute(new HibernateCallback<Object>() {
			public Object doInHibernate(org.hibernate.Session session) throws org.hibernate.HibernateException {
				Query query = session.createQuery(queryString);
				
				for(int i=0;i<paramNames.length;i++)
				{
					query.setParameter(paramNames[i], values[i]);
				}
				query.setFirstResult(page.getBeginIndex());//设置起点start
				
				query.setMaxResults(page.getEveryPage());//设置每页显示items
				
				List<Object> rows = query.list();
				return rows;
			}
		});
	}
	@SuppressWarnings("unchecked")
	
	@Override
	public List<Object> queryIndexList(Class clazz,String table, String group, String order, int num) {
		// TODO Auto-generated method stub
		//select * from (select * from test.test r order by r.size desc) t group by t.type ORDER BY size DESC LIMIT 3 ;
		
		return (List<Object>) getHibernateTemplate().execute(new HibernateCallback<Object>() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				// TODO Auto-generated method stub
				String queryString = "select * from (select * from "+table+" r order by r."+order+" desc) t group by t."+group+"  order by t."+order+" desc limit "+num;
				Query query = session.createSQLQuery(queryString).addEntity(clazz);
				return query.list();
			}
		});
	}
	
	@SuppressWarnings("unchecked")
	public List<Object> queryCurrentList(Class clazz,String table,String start,String end,int num) {
		// TODO Auto-generated method stub
		//select * from (select * from test.test r order by r.size desc) t group by t.type ORDER BY size DESC LIMIT 3 ;
		
		return (List<Object>) getHibernateTemplate().execute(new HibernateCallback<Object>() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				// TODO Auto-generated method stub
				String queryString = "select * from "+table+" where current_timestamp() between "+start+" and "+end+" order by "+start+" asc  limit "+num;
				Query query = session.createSQLQuery(queryString).addEntity(clazz);
				return query.list();
			}
		});
	}
	@SuppressWarnings("unchecked")
	public List<Object> queryRecentlyList(Class clazz,String table,String start,int num) {
		// TODO Auto-generated method stub
		//select * from (select * from test.test r order by r.size desc) t group by t.type ORDER BY size DESC LIMIT 3 ;
		return (List<Object>) getHibernateTemplate().execute(new HibernateCallback<Object>() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				// TODO Auto-generated method stub
				String queryString = "select * from "+table+" where current_timestamp() < "+start+" order by "+start+" asc  limit "+num;
				Query query = session.createSQLQuery(queryString).addEntity(clazz);
				return query.list();
			}
		});
	}
	
	@SuppressWarnings("unchecked")
	public List<Object> queryHistoryList(Class clazz,String table,String end,int num) {
		// TODO Auto-generated method stub
		//select * from (select * from test.test r order by r.size desc) t group by t.type ORDER BY size DESC LIMIT 3 ;
		return (List<Object>) getHibernateTemplate().execute(new HibernateCallback<Object>() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				// TODO Auto-generated method stub
				String queryString = "select * from "+table+" where current_timestamp() > "+end+" order by "+end+" desc  limit "+num;
				Query query = session.createSQLQuery(queryString).addEntity(clazz);
				return query.list();
			}
		});
	}
	@Override
	public void updateExecute(String sql) {
		// TODO Auto-generated method stub
		getHibernateTemplate().execute(new HibernateCallback<Object>() {
			public Object doInHibernate(org.hibernate.Session session) throws org.hibernate.HibernateException {
				session.createSQLQuery(sql).executeUpdate();
				return null;
			}
		});
	}
}
