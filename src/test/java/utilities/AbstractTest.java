package utilities;

import org.junit.After;
import org.junit.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.TestingAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import security.LoginService;

public abstract class AbstractTest {

	@Autowired
	private LoginService loginService;

	@Before
	public void setUp() throws Throwable {
		PopulateDatabase.main(null);
	}

	@After
	public void tearDown() {
	}

	public void authenticate(String username) {
		UserDetails userDetails;
		TestingAuthenticationToken authenticationToken;
		SecurityContext context;

		if (username == null)
			authenticationToken = null;
		else {
			userDetails = loginService.loadUserByUsername(username);
			authenticationToken = new TestingAuthenticationToken(userDetails, null);
		}

		context = SecurityContextHolder.getContext();
		context.setAuthentication(authenticationToken);
	}

	public void unauthenticate() {
		authenticate(null);
	}

}
