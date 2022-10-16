(define (problem Monster1)

    (:domain gameDomain)
    
    (:objects loc1 loc2 loc3 loc4 loc5 loc6 treasure4 gameHero)
    
    (:init
        (cave loc1)
        (cave loc2)
        (cave loc3)
        (cave loc4)
        (cave loc5)
        (cave loc6)
        (hero gameHero)
        (hero_at gameHero loc1)
        (monster_at loc6)
        (pit_at loc5)
        (treasure treasure4)
        (treasure_at treasure4 loc4)
        (leads_to loc1 loc2)
        (leads_to loc1 loc6)
        (leads_to loc1 loc5)
        (leads_to loc2 loc1)
        (leads_to loc2 loc3)
        (leads_to loc3 loc2)
        (leads_to loc3 loc4)
        (leads_to loc4 loc3)
        (leads_to loc5 loc4)
        (leads_to loc6 loc4)
    )
    
    (:goal (and (hero_at gameHero loc1) (hasTreasure gameHero treasure4)))
    
)
