package com.example.test.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.test.model.Member;
import com.example.test.repository.MemberRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
public class MemberController {
	private final MemberRepository memberRepository;
	
	// 회원정보 추가
	@PostMapping("members")
	public String addMember(@RequestBody Member member) {
		log.info("member: {}", member);
		memberRepository.save(member);
		return "ok";
	}
	
	
	// 회원정보 전체 조회
	@GetMapping("members")
	public List<Member> findMembers() {
		return memberRepository.findAll();
		
	}
}
