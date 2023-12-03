package services;

import java.util.List;

import dao.IDaoLocalHotel;
import dao.IDaoRemote;
import entities.Hotel;
import entities.Ville;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;


@Stateless(name="Hotel")
public class HotelService implements IDaoRemote<Hotel>,IDaoLocalHotel{
@PersistenceContext
private EntityManager em;

public Hotel create(Hotel o) {
	em.persist(o);
	return o;
}
public Hotel update(Hotel o) {
	Hotel mergedHotel = em.merge(o);
	
	return mergedHotel;
	
}
public boolean delete(Hotel o) {
    Hotel mergedHotel = em.merge(o);
    
	 
    em.remove(mergedHotel);
	
	
	return true;
}
@Override
public Hotel findById(int id) {
return em.find(Hotel.class,id);
}
@Override
public List<Hotel> findAll() {
	
	Query query= em.createQuery("select h from Hotel h");	
	return query.getResultList();
}

@Override
public List<Hotel> findByVille(Ville ville) {
	    Query query = em.createQuery("SELECT h FROM Hotel h WHERE h.ville = :villeParam");
	    query.setParameter("villeParam", ville);
	    return query.getResultList();
	}

	
	
}

