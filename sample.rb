class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    puts "数字を入力してください"
    puts "0: グー"
    puts "1: チョキ"
    puts "2: パー"
    player_hand = gets.to_i
  end
end


class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    enemy_hand = rand(3)
  end
end


class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    if player_hand < 0 || player_hand > 2
      puts "0〜2の数字を入力してください。"
      return true
    end
    
    janken = ["グー","チョキ","パー"]
    
    judge = (player_hand-enemy_hand+3)%3
    if judge == 2
      puts "相手の手は#{janken[enemy_hand]}です。あなたの勝ちです"
      return false
      
    elsif judge == 1
      puts "相手の手は#{janken[enemy_hand]}です。あなたの負けです"
      return false
      
    elsif judge == 0
      puts "相手の手は#{janken[enemy_hand]}です。あいこです"
      return true
    end
  end

    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
end


player = Player.new
enemy = Enemy.new
janken = Janken.new

# その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
next_game = true

# 下記の記述で、ジャンケンメソッドが起動される
while next_game
  next_game = janken.pon(player.hand, enemy.hand)
end