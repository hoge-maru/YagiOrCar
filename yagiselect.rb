def dp(str)
	#p str
end

class Owner

	def getOther
		return @other
	end	

	def chooseOther
	
		array = [0, 1, 2]
		array.delete(@challengerSelected)
		array.delete(@answer)
		@other =  array.pop
	end
	
	def getChallengerSelected(val)
		@challengerSelected = val
	end

	def initialize(answer)
		@answer = answer
		@other = -1
	end
end

class Challenger
	
	def selectDoor
		@select = rand(3)
	end
	
	def getDoor
		return @select
	end

	def changeDoor(ownerSelect)
		array = [0, 1, 2]
		array.delete(ownerSelect)
		array.delete(@select)
		return array.pop
	end
	
	def initialize
		@select = -1
		selectDoor()
	end
	
end


class Game

	def playNochange
		success = 0
		fail = 0
		
		for i in 1...10000
			@collect = rand(3)
			dp "-----"
			dp "collect:#{@collect}"
			@owner = Owner.new(@collect)
			@challenger = Challenger.new
			select = @challenger.selectDoor
			dp "select:#{select}"
			@owner.getChallengerSelected(select)
			@owner.chooseOther()
			other = @owner.getOther
			dp "other:#{other}"
		
			if @challenger.getDoor == @collect
				success = success + 1
			else
				fail = fail+1
			end
			
		end
		
		rate = success.prec_f / (success + fail).prec_f
		p "success #{success}"
		p "fail    #{fail}"
		p "success rate: #{rate}"



	end

	def playChange
		success = 0
		fail = 0
		
		for i in 1...10000
			@collect = rand(3)
			dp "-----"
			dp "collect:#{@collect}"
			@owner = Owner.new(@collect)
			@challenger = Challenger.new
			select = @challenger.selectDoor
			dp "select:#{select}"
			@owner.getChallengerSelected(select)
			@owner.chooseOther()
			other = @owner.getOther
			dp "other:#{other}"
			rtn = @challenger.changeDoor(other)
			dp "change:#{rtn}"
		
			if rtn == @collect
				success = success + 1
			else
				fail = fail+1
			end
			
		end
		
		rate = success.prec_f / (success + fail).prec_f
		p "success #{success}"
		p "fail    #{fail}"
		p "success rate: #{rate}"


	end	

	def initialize
	end
end

game = Game.new
game.playChange
game.playNochange


