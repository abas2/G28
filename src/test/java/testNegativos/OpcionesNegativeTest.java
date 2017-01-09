package testNegativos;

import java.util.Collection;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.util.Assert;

import domain.Opcion;
import domain.Pregunta;
import services.OpcionService;
import services.PreguntaService;
import utilities.AbstractTest;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/datasource.xml", "classpath:spring/config/packages.xml" })
@TransactionConfiguration(defaultRollback = true)
public class OpcionesNegativeTest extends AbstractTest {

	@Autowired
	private OpcionService opcionService;
	@Autowired
	private PreguntaService preguntaService;

	@Test(expected = IllegalArgumentException.class)
	public void testFindOneOpciones() {
		Opcion opcions;
		opcions = opcionService.findOne(49);
		Assert.notNull(opcions);

	}

	@Test(expected = IllegalArgumentException.class)
	public void testFindOneOpciones1() {
		Opcion opcions;
		opcions = opcionService.findOne(8);
		Assert.isTrue(opcions.getTexto() == "Prueba Mala");

	}

	@Test(expected = IllegalArgumentException.class)
	public void testFindOpcioneByPregunta() {
		Pregunta pregunta;
		pregunta = preguntaService.findOne(6);
		Collection<Opcion> opcions;
		opcions = opcionService.opcionesPregunta(pregunta);
		Opcion opcion;
		opcion = opcionService.findOne(8);

		Opcion opcion1;
		opcion1 = opcionService.findOne(9);

		Opcion opcion2;
		opcion2 = opcionService.findOne(10);

		Assert.isTrue(opcions.contains(opcion));
		Assert.isTrue(opcions.contains(opcion1));
		Assert.isTrue(opcions.contains(opcion2));
	}

}
