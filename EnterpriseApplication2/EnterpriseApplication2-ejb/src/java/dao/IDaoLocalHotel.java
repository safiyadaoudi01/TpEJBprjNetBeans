/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Hotel;
import entities.Ville;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author safiya
 */
@Local
public interface IDaoLocalHotel extends IDaoLocale<Hotel>{
    public List<Hotel> findByVille(Ville ville);


}
