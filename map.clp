(deftemplate  observations (multislot boom) (multislot status))
 
(deffacts initial-states 
    ;n ntar diisi ukuran map 
   	(xmax n)
    (ymax n)
    ;taruh letak boom
	(boom x y)
    ;status setiap kotak pada map 0 awalnya, status itu kayak nomor di gamenya.
    ;close/open (c/p) itu buat tanda ketutup atau buka, awalnya close semua
    (status x y 0 c)
)


(defrule status-boomarea
    (boom $?xpos $?ypos)
=>
    (assert ( status (+ ?sts 1) $?xpos (+ 1 $ypos))
    (assert ( status (+ ?sts 1) (+ 1 $xpos) $ypos))
    (assert ( status (+ ?sts 1) (+ 1 $xpos) (+ 1 $ypos)))
    (assert ( status (+ ?sts 1) $xpos (- 1 $ypos)))
    (assert ( status (+ ?sts 1) (- $xpos 1 ) $ypos))
    (assert ( status (+ ?sts 1) (- $xpos 1 ) (- $ypos 1)))
)
