package services;

import java.util.List;

import dao.IDaoLocalVille;
import dao.IDaoRemote;
import entities.Ville;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless(name = "Ville")
public class VilleService implements IDaoRemote<Ville>, IDaoLocalVille {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Ville create(Ville o) {
		em.persist(o);
		return o;
	}

	@Override
	public boolean delete(Ville o) {
		em.remove(em.contains(o) ? o : em.merge(o));
		return true;
	}

	@Override
	public Ville update(Ville o) {
		// TODO Auto-generated method stub
		 Ville mergedVille = em.merge(o);
		 return mergedVille;
		 }

	@Override
	public Ville findById(int id) {
		// TODO Auto-generated method stub
		return em.find(Ville.class, id);
	}

	@Override
	public List<Ville> findAll() {
		Query query = em.createQuery("select v from Ville v");
		return query.getResultList();
	}

}
