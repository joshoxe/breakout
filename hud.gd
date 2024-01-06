extends CanvasLayer


func update_score(score):
	$ScoreLabel.text = str(score)

func update_lives(lives):
	match lives:
		3:
			$lives.set_3_hearts()
		2:
			$lives.set_2_hearts()
		1:
			$lives.set_1_hearts()
		0:
			$lives.set_0_hearts()
			
