package kosta.mvc;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import kosta.mvc.repository.CommunityRepository;

@SpringBootTest
@Commit
@Transactional
public class SamjinTests {
	
	@Autowired
	private CommunityRepository communityRepository;
	


}
