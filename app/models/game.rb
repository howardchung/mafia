class Game
  
  attr_accessor :players, :votes, :mafia, :dead_players, :player_hash,:night,:mafia_kill, :game_over, :end_time
  
  #TODO
  #manage game state though stage system, indices in array
#don’t allow new players after game start
#reset the game after finishing a round
#must be 4 players to start
#have more than one mafia (how do mafia agree)
#extra game options (doctor, detective)
#status page
#document API
#allow timed or untimed game


  def initialize
    self.players=[]
    self.mafia=nil
    self.dead_players=[]
    self.votes={}
    self.player_hash={}
    self.night=false
    self.game_over=false
  end

  def add_player(n)
    p = Player.new
    p.name=n
    p.id=self.players.length+1
    self.players << p
    self.player_hash[self.players.length]=n
    p
  end
 

  def kill_player(id)
    if id!=-1
      for player in players
        if player.id.to_i==id.to_i
          players.delete(player)
        end
      end
      self.dead_players<<(id)
    end
    if id.to_i==self.mafia.to_i
      self.game_over=true
    end
    if self.players.length==2
      self.game_over=true
    end

  end
  

  def start
    self.mafia=1+rand(self.players.length)
    #self.mafia=2
    self.begin_next_round
  end

  def begin_next_round
    self.votes={}
    self.end_time=Time.zone.now.to_i+20
  end
  


  def end_round
    tally={}
    for vote in self.votes.keys do
      tally[self.votes[vote]]||=0
      tally[self.votes[vote]]+=1
    end
    max=0
    maxplayer=-1
    for id in tally.keys
      if tally[id]>max
        max=tally[id]
        maxplayer=id
      elsif tally[id]==max
        maxplayer=-1
      end

    end
    self.kill_player(maxplayer)
    self.night = true
    return maxplayer
  end



  
  def vote(voter,kill)
    self.votes[voter]=kill
  end

  def get_votes
    hash={}
    hash["votes"]=self.votes
    hash["finished"]=false
    if Time.now.to_i > self.end_time
      hash["finished"]=true
      
      hash["victim"]=self.end_round
    end
    
    hash

  end

  
end
