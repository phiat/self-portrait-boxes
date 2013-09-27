(ns self-portrait-boxes.core
	(:use quil.core))

(defn setup []
  (smooth)                       
  (frame-rate 1)                 
  (background 0))                
                                 
(defn draw []
	(box 20 20 20)
	)       

(defsketch self-portrait-boxes
  :title "self portrait"  
  :setup setup                      
  :draw draw                        
  :size [640 480]
  :renderer :p3d)


  
  

