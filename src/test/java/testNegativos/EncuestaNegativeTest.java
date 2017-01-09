package testNegativos;

import java.util.Collection;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.util.Assert;

import domain.Encuesta;
import services.EncuestaService;
import utilities.AbstractTest;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/datasource.xml", "classpath:spring/config/packages.xml" })
@TransactionConfiguration(defaultRollback = true)
public class EncuestaNegativeTest extends AbstractTest {

	@Autowired
	private EncuestaService encuestaService;

	@Test(expected = IllegalArgumentException.class)
	public void testAllEncuesta() {
		Collection<Encuesta> encuestas;
		encuestas = encuestaService.findAll();
		Assert.isTrue(encuestas.size() == 4);
	}

	@Test(expected = IllegalArgumentException.class)
	public void testFindEncuestaByKeyword() {
		Collection<Encuesta> encuestas;
		encuestas = encuestaService.findEncuestaByKeyord("prueba fallida");
		Assert.isTrue(encuestas.size() > 0);
	}

	@Test(expected = IllegalArgumentException.class)
	public void testFindOneEncuesta() {
		Encuesta encuesta;
		encuesta = encuestaService.findOne(50);
		Assert.notNull(encuesta);
	}

}
