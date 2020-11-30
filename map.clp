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

(defrule open-map-right
    (status ?x ?y p 0)(status (+ ?x 1) ?y c ?s)(+ ?x 1) <= ?xmax)(xmax ?xmax)
=>
    (assert (status (+ ?x 1) ?y p ?s))
)


(defrule open-map-bottom
    (status ?x ?y p 0)(status ?x (+ ?y 1) c ?s)(+ ?y 1) <= ?ymax)(ymax ?ymax)
=>
    (assert (status ?x (+ ?y 1) p ?s))
)

(defrule open-map-up
    (status ?x ?y p 0)(status ?x (- ?y 1) c ?s)(- ?y 1) >= 0)
=>
    (assert (status ?x (- ?y 1) p ?s))
)

(defrule open-map-left
    (status ?x ?y p 0)(status (- ?x 1) ?y c ?s)(- ?x 1) >= 0)
=>
    (assert (status (- ?x 1) ?y p ?s))
)
