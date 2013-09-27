(ns self-portrait-boxes.core
	(:use quil.core))

(defn setup []
  (smooth)                       
  (frame-rate 1)                 
  (background 0))                
                                 
(defn draw []

	)       

(defsketch self-portrait-boxes
  :title "self portrait"  
  :setup setup                      
  :draw draw                        
  :size [640 480])                  


  
  

