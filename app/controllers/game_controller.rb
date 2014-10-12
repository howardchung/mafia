class GameController < ApplicationController
    def client
        @server=root_url
    end

    def join
        me=@@g.add_player(params[:name])
        render :json=> {:id=>me.id,:name=>me.name}
    end

    def roundend
        render :json=>@@g.end_time.to_i
    end

    def start_game
        if not @@g.mafia
            @@g.start
        end
        render :nothing=>true
    end
    def who
        render :json=>@@g.mafia
    end

    def reset
        @@g=Game.new
        render :nothing=>true
    end

    def get_players
        render :json=>@@g.players
    end

    def get_player_hash
        render :json=>@@g.player_hash
    end
    def vote
        @@g.vote(params[:voter],params[:kill])
        render :nothing=>true
    end

    def begin_next_round
        @@g.begin_next_round
        render :nothing=>true
    end

    def mafia_kill
        @@g.kill_player(params[:kill])
        @@g.mafia_kill=(params[:kill])
        @@g.night=false
        render :nothing=>true
    end

    def gameover

        render :json=> @@g.game_over
    end

    def is_night
        hash={}
        hash["finished"]=false
        if @@g.night==false
            hash["finished"]=true
            hash["victim"]=@@g.mafia_kill.to_i
        end
        render :json=>hash
    end

    def vote_results

        render :json=>@@g.get_votes

    end

    def peasant_kill
        render :json=>@@g.peasant_kill.to_i
    end

    def get_dead_players
        render :json=>@@g.dead_players
    end

    def has_game_started
        id=params[:id].to_i
        if @@g.mafia
            if id==@@g.mafia
                render :json=>{:result=>"mafia"}
            else
                render :json=>{:result=>"peasant"}
            end
        else
            render :json=>{:result=>"waiting"}
        end
    end

end
