package de.accso.java.graalvm.springbootgreetingserver

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController
import java.util.concurrent.atomic.AtomicLong


@SpringBootApplication
class SpringBootGreetingserverApplication

fun main(args: Array<String>) {
	runApplication<SpringBootGreetingserverApplication>(*args)
}


@RestController
class GreetingController {

	val template = "Hello, %s!"
	val counter: AtomicLong = AtomicLong()

	@GetMapping("/greeting")
	fun greeting(@RequestParam(value = "name", defaultValue = "World") name: String) =
		Greeting(counter.incrementAndGet(), String.format(template, name))
}

data class Greeting(val id: Long?, val content: String)
