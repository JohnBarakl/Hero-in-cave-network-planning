(define (domain gameDomain)

    (:requirements :strips :negative-preconditions)
    
    (:predicates
        (hero ?x)
        (hero_at ?x ?y)
        (cave ?x)
        (leads_to ?x ?y)
        (monster_at ?x)
        (treasure ?x)
        (treasure_at ?x ?y)
        (hasTreasure ?x ?y)
        (weapon ?x)
        (weapon_at ?x ?y)
        (has_weapon ?x ?y)
        (pit_at ?x)
        (magic_shoes ?x)
        (magic_shoes_at ?x ?y)
        (has_magic_shoes ?x ?y)
    )
    
    (:action move_from_x_to_y
        :parameters ( ?h ?x ?y )
        :precondition (and (hero ?h) (cave ?x) (cave ?y) (hero_at ?h ?x) (leads_to ?x ?y) (not (monster_at ?x)) (not (pit_at ?y)))
        :effect (and (hero_at ?h ?y) (not (hero_at ?h ?x)))
    )
    (:action move_from_x_to_y_over_pit
        :parameters ( ?h ?x ?y ?s )
        :precondition (and (hero ?h) (cave ?x) (cave ?y) (magic_shoes ?s) (hero_at ?h ?x) (leads_to ?x ?y) (not (monster_at ?x)) (pit_at ?y) (has_magic_shoes ?h ?s))
        :effect (and (hero_at ?h ?y) (not (hero_at ?h ?x)) (not (has_magic_shoes ?h ?s)))
    )
    (:action kill_monster_from_x_to_y
        :parameters ( ?h ?x ?y ?w )
        :precondition (and (hero ?h) (cave ?x) (cave ?y) (weapon ?w) (hero_at ?h ?x) (leads_to ?x ?y) (monster_at ?y) (has_weapon ?h ?w))
        :effect (and (not (monster_at ?y)) (not (has_weapon ?h ?w)))
    )
    (:action pick_up_weapon
        :parameters ( ?h ?c ?w )
        :precondition (and (hero ?h) (cave ?c) (weapon ?w) (hero_at ?h ?c) (weapon_at ?w ?c))
        :effect (and (has_weapon ?h ?w) (not (weapon_at ?w ?c)))
    )
    (:action pick_up_magic_shoes
        :parameters ( ?h ?c ?s )
        :precondition (and (hero ?h) (cave ?c) (magic_shoes ?s) (hero_at ?h ?c) (magic_shoes_at ?s ?c))
        :effect (and (has_magic_shoes ?h ?s) (not (magic_shoes_at ?s ?c)))
    )
    (:action pick_up_treasure
        :parameters ( ?h ?c ?t)
        :precondition (and (hero ?h) (cave ?c) (treasure ?t) (hero_at ?h ?c) (treasure_at ?t ?c))
        :effect (and (hasTreasure ?h ?t) (not (treasure_at ?t ?c)))
    )
    
)
