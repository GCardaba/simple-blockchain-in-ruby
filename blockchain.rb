
require 'digest'    							# For hash checksum digest function SHA256
require 'pp'        							# For pp => pretty printer
# require 'pry'                     # For on the fly debugging
require_relative 'block'					# class Block
require_relative 'transaction'		# method Transactions

LEDGER = []

def create_first_block
	i = 0
	instance_variable_set( "@b#{i}", 
												 Block.first( 
													{ from: "user1", to: "user2", what: "element", qty: 10, clave: "clave1"},
													{ from: "user3", to: "user1", what: "element2", qty: 7, clave: "clave2" } )
											 )
	LEDGER << @b0
	pp @b0
	p "============================"
	add_block
end
	
	
	
def add_block
	i = 1
	loop do
		instance_variable_set("@b#{i}", Block.next( (instance_variable_get("@b#{i-1}")), get_transactions_data))
		LEDGER << instance_variable_get("@b#{i}")
		p "============================"
		pp instance_variable_get("@b#{i}")
		p "============================"
		i += 1
	end
end

def launcher
	puts "==========================="
	puts ""
	puts "Welcome to Simple Blockchain In Ruby !"
	puts ""
	sleep 1.5
	puts "This program was created by Anthony Amar for and educationnal purpose"
	puts ""
	sleep 1.5
	puts "Wait for the genesis (the first block of the blockchain)"
	puts ""
	for i in 1..10
		print "."
		break if i == 10
	end
	sleep 1
	puts "" 
	puts "" 
	puts "==========================="
	create_first_block
end


launcher
