(define (problem transport-5-packages-advanced)
  (:domain logistics)
  
  (:objects
    Berlin Warszawa Gdansk Sztokholm Wroclaw Poznan - city
    PortGdansk PortSztokholm - port
    AirportBerlin AirportWarszawa AirportGdansk AirportSztokholm AirportWroclaw - airport
    p1 p2 p3 p4 p5 - package
    t1 t2 t3 t4 t5 t6 - truck
    a1 a2 - airplane
    s1 - ship
  )
  
  (:init
    (= (total-cost) 0)
    (= (load-cost) 5)
    (= (unload-cost) 5)

    (link-road Wroclaw Poznan) (link-road Poznan Wroclaw)
    (link-road Poznan Warszawa) (link-road Warszawa Poznan)
    (link-road Warszawa Gdansk) (link-road Gdansk Warszawa)
    (link-road Poznan Berlin) (link-road Berlin Poznan)
    (link-road Wroclaw Berlin) (link-road Berlin Wroclaw)

    (link-road Gdansk PortGdansk) (link-road PortGdansk Gdansk)
    (link-road Sztokholm PortSztokholm) (link-road PortSztokholm Sztokholm)
    (link-road Berlin AirportBerlin) (link-road AirportBerlin Berlin)
    (link-road Warszawa AirportWarszawa) (link-road AirportWarszawa Warszawa)
    (link-road Gdansk AirportGdansk) (link-road AirportGdansk Gdansk)
    (link-road Sztokholm AirportSztokholm) (link-road AirportSztokholm Sztokholm)
    (link-road Wroclaw AirportWroclaw) (link-road AirportWroclaw Wroclaw)

    (link-air AirportWarszawa AirportBerlin) (link-air AirportBerlin AirportWarszawa)
    (link-air AirportWarszawa AirportSztokholm) (link-air AirportSztokholm AirportWarszawa)
    (link-air AirportGdansk AirportWroclaw) (link-air AirportWroclaw AirportGdansk)

    (link-water PortGdansk PortSztokholm) (link-water PortSztokholm PortGdansk)

    (= (cost-road Wroclaw Poznan) 20) (= (cost-road Poznan Wroclaw) 20)
    (= (cost-road Poznan Warszawa) 30) (= (cost-road Warszawa Poznan) 30)
    (= (cost-road Warszawa Gdansk) 40) (= (cost-road Gdansk Warszawa) 40)
    (= (cost-road Poznan Berlin) 30) (= (cost-road Berlin Poznan) 30)
    (= (cost-road Wroclaw Berlin) 40) (= (cost-road Berlin Wroclaw) 40)

    (= (cost-road Gdansk PortGdansk) 5) (= (cost-road PortGdansk Gdansk) 5)
    (= (cost-road Sztokholm PortSztokholm) 5) (= (cost-road PortSztokholm Sztokholm) 5)
    (= (cost-road Berlin AirportBerlin) 5) (= (cost-road AirportBerlin Berlin) 5)
    (= (cost-road Warszawa AirportWarszawa) 5) (= (cost-road AirportWarszawa Warszawa) 5)
    (= (cost-road Gdansk AirportGdansk) 5) (= (cost-road AirportGdansk Gdansk) 5)
    (= (cost-road Sztokholm AirportSztokholm) 5) (= (cost-road AirportSztokholm Sztokholm) 5)
    (= (cost-road Wroclaw AirportWroclaw) 5) (= (cost-road AirportWroclaw Wroclaw) 5)

    (= (cost-air AirportWarszawa AirportBerlin) 150) (= (cost-air AirportBerlin AirportWarszawa) 150)
    (= (cost-air AirportWarszawa AirportSztokholm) 200) (= (cost-air AirportSztokholm AirportWarszawa) 200)
    (= (cost-air AirportGdansk AirportWroclaw) 180) (= (cost-air AirportWroclaw AirportGdansk) 180)

    (= (cost-water PortGdansk PortSztokholm) 50) (= (cost-water PortSztokholm PortGdansk) 50)

    (at-veh t1 Poznan) (at-veh t2 Warszawa) (at-veh t3 Sztokholm)
    (at-veh t4 Gdansk) (at-veh t5 Berlin) (at-veh t6 Wroclaw)
    (at-veh a1 AirportWarszawa) (at-veh a2 AirportGdansk)
    (at-veh s1 PortGdansk)

    (at-pkg p1 Wroclaw) (at-pkg p2 Berlin) (at-pkg p3 Warszawa)
    (at-pkg p4 Sztokholm) (at-pkg p5 Gdansk)
  )
  
  (:goal
    (and
      (at-pkg p1 Sztokholm)
      (at-pkg p2 Warszawa)
      (at-pkg p3 Berlin)
      (at-pkg p4 Wroclaw)
      (at-pkg p5 Poznan)
    )
  )
  
  (:metric minimize (total-cost))
)