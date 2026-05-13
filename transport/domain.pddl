(define (domain logistics)
  (:requirements :typing :strips :numeric-fluents :action-costs)
  
  (:types
    place package vehicle - object
    city port airport - place
    truck airplane ship - vehicle
  )
  
  (:predicates
    (at-pkg ?p - package ?pl - place)
    (at-veh ?v - vehicle ?pl - place)
    (in ?pkg - package ?veh - vehicle)
    (link-road ?pl1 - place ?pl2 - place)
    (link-air ?a1 - airport ?a2 - airport)
    (link-water ?p1 - port ?p2 - port)
  )
  
  (:functions
    (total-cost)
    (cost-road ?pl1 - place ?pl2 - place)
    (cost-air ?a1 - airport ?a2 - airport)
    (cost-water ?p1 - port ?p2 - port)
    (load-cost)
    (unload-cost)
  )
  
  (:action load
    :parameters (?v - vehicle ?p - package ?pl - place)
    :precondition (and 
      (at-veh ?v ?pl) 
      (at-pkg ?p ?pl)
    )
    :effect (and 
      (not (at-pkg ?p ?pl)) 
      (in ?p ?v)
      (increase (total-cost) (load-cost))
    )
  )
  
  (:action unload
    :parameters (?v - vehicle ?p - package ?pl - place)
    :precondition (and 
      (at-veh ?v ?pl) 
      (in ?p ?v)
    )
    :effect (and 
      (not (in ?p ?v)) 
      (at-pkg ?p ?pl)
      (increase (total-cost) (unload-cost))
    )
  )
  
  (:action drive-truck
    :parameters (?t - truck ?pl1 - place ?pl2 - place)
    :precondition (and 
      (at-veh ?t ?pl1) 
      (link-road ?pl1 ?pl2)
    )
    :effect (and 
      (not (at-veh ?t ?pl1)) 
      (at-veh ?t ?pl2)
      (increase (total-cost) (cost-road ?pl1 ?pl2))
    )
  )
  
  (:action fly-airplane
    :parameters (?a - airplane ?a1 - airport ?a2 - airport)
    :precondition (and 
      (at-veh ?a ?a1) 
      (link-air ?a1 ?a2)
    )
    :effect (and 
      (not (at-veh ?a ?a1)) 
      (at-veh ?a ?a2)
      (increase (total-cost) (cost-air ?a1 ?a2))
    )
  )
  
  (:action sail-ship
    :parameters (?s - ship ?p1 - port ?p2 - port)
    :precondition (and 
      (at-veh ?s ?p1) 
      (link-water ?p1 ?p2)
    )
    :effect (and 
      (not (at-veh ?s ?p1)) 
      (at-veh ?s ?p2)
      (increase (total-cost) (cost-water ?p1 ?p2))
    )
  )
)