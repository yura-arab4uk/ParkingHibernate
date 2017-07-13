package com.parking.model.business.impl;

import com.parking.model.business.service.DAO;
import com.parking.model.entities.Item;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by Yurii on 17.01.2017.
 */
public class SQLDAO<T extends Item<T>> implements DAO<T> {
    public abstract class Action {
        private Object [] values=null;
        public abstract Object act(Session session) throws HibernateException;

        public Object [] getValues() {
            return values;
        }

        public void setValues(Object... values) {
            this.values = values;
        }
    }
    Class<T> tClass;
    String tableName;

    protected Action getter = new Action(){

        public Object act(Session session) throws HibernateException{
            Query query = session.createQuery("FROM " + tableName + " where enabled=:e and id=:id");
            query.setParameter("id",getValues()[0]);
            query.setParameter("e",1);
            return query.uniqueResult();
        }

    };
    protected Action allGetter = new Action(){

        public Object act(Session session) throws HibernateException{
            return session.createCriteria(tClass).add(Restrictions.eq("enabled",1)).list();
        }

    };
    protected Action updater=new Action(){

        public Object act(Session session) throws HibernateException{
            session.update(getValues()[0]);
            return null;
        }


    };
    protected Action adder=new Action(){

        public Object act(Session session) throws HibernateException{
            Iterable<T> items=(Iterable<T>)getValues()[0];
            Long i=new Long(0);
            List<Long> ids=new ArrayList<>();
            for (T item : items) {
                ids.add((Long)session.save(item));
                if( i % 50 == 0 ) { // Same as the JDBC batch size
                    //flush a batch of inserts and release memory:
                    session.flush();
                    session.clear();
                }
                i++;
            }
            return ids;
        }

    };
    protected Action remover=new Action(){
        public Object act(Session session) throws HibernateException{
            Item<T> item = (Item<T>) getValues()[0];
            item.setEnabled(0);
            session.update(item);
            return null;
        };

    };
    public SQLDAO(Class<T> tClass) {
        this.tClass=tClass;
        this.tableName=tClass.getSimpleName();
    }

    public Object setDB (Action action){
        SessionFactory sessionFactory=HibernateUtil.getSessionfactory();
        Session session=null;
        Object result=null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            result = action.act(session);
            session.getTransaction().commit();
        }
        catch(HibernateException e){
            session.getTransaction().rollback();
            e.printStackTrace();
        }
        finally {
            try {
                session.close();
            } catch (HibernateException e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    @Override
    public List<Long> add(Iterable<T> items) {
        adder.setValues(items);
        return (List<Long>)setDB(adder);
    }

    @Override
    public Long add(T item) {
        return add(Collections.singletonList(item)).get(0);
    }

    @Override
    public void update(T item){
        updater.setValues(item);
        setDB(updater);
    };



    @Override
    public void remove(T item) {
        remover.setValues(item);
        setDB(remover);


    }



    @Override
    public T get(Long id) {

        getter.setValues(id);
        return (T)setDB(getter);

    }

    @Override
    public List<T> getAll() {

        return (List<T>)setDB(allGetter);

    }

//    public T getLast(){
//        return (T)setDB(new Action() {
//            @Override
//            public Object act(Session session) throws HibernateException {
//                Query query = session.createQuery("FROM " + tableName + " where id=(SELECT MAX(id) FROM " + tableName + " WHERE enabled=1)");
//                return query.uniqueResult();
//            }
//
//
//        });
//    };
}
