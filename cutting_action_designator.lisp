;;; action-designator cutting uses this inference to resolve action
(<- (desig:action-grounding ?action-designator (slice ?resolved-action-designator))
    (spec:property ?action-designator (:type :slicing))
    ;; extract info from ?action-designator
    (spec:property ?action-designator (:object ?object-designator))
    (desig:current-designator ?object-designator ?current-object-desig)
    (spec:property ?current-object-desig (:type ?object-type))
    (spec:property ?current-object-desig (:name ?object-name))
    
    ;; infer information which robot arm to use either internally or query ontology
    (-> (spec:property ?action-designator (:arm ?arm))
        (true)
        (man-int:robot-free-hand ?_ ?arm))
    
    (lisp-fun man-int:get-object-old-transform ?current-object-desig ?object-transform)

    ;; infer missing information like ?grasp type, gripping ?maximum-effort, manipulation poses
    (lisp-fun man-int:calculate-object-faces ?object-transform (?facing-robot-face ?bottom-face))
    (-> (man-int:object-rotationally-symmetric ?object-type)
        (equal ?rotationally-symmetric t)
        (equal ?rotationally-symmetric nil))
    
    ;; infer information which grasp to use either internally or query ontology
    (-> (spec:property ?action-designator (:grasp ?grasp))
        (true)
        (and (lisp-fun man-int:get-action-grasps ?object-type ?arm ?object-transform ?grasps)
             (member ?grasp ?grasps)))
    
    (lisp-fun man-int:get-action-gripping-effort ?object-type ?effort)
    (lisp-fun man-int:get-action-gripper-opening ?object-type ?gripper-opening)

    ;; calculate trajectory
    (equal ?objects (?current-object-desig))
    
    ;; infer information which robot trajectory to use either internally or query ontology
    (-> (equal ?arm :left)
        (and (lisp-fun man-int:get-action-trajectory :slicing ?arm ?grasp T ?objects
                       ?left-slicing-pose)
             (lisp-fun man-int:get-traj-poses-by-label ?left-slicing-pose :slice-up
                       ?left-slice-up-poses)
             (lisp-fun man-int:get-traj-poses-by-label ?left-slicing-pose :slice-down
                       ?left-slice-down-poses))
        (and (equal ?left-slice-up-poses NIL)
             (equal ?left-slice-down-poses NIL)))
    
    (-> (equal ?arm :right)
        (and (lisp-fun man-int:get-action-trajectory :slicing ?arm ?grasp T ?objects
                       ?right-slicing-pose)
             (lisp-fun man-int:get-traj-poses-by-label ?right-slicing-pose :slice-up
                       ?right-slice-up-poses)
             (lisp-fun man-int:get-traj-poses-by-label ?right-slicing-pose :slice-down
                       ?right-slice-down-poses))
        (and(equal ?right-slice-up-poses NIL)
            (equal ?right-slice-down-poses NIL)))
    ;; infer information which collision-mode to use either internally or query ontology
    (-> (desig:desig-prop ?action-designator (:collision-mode ?collision-mode))
        (true)
        (equal ?collision-mode nil))
    
    ;;put together resulting action designator
    (desig:designator :action ((:type :slicing)
                               (:object ?current-object-desig)
                               (:object-name  ?object-name)
                               (:arm ?arm)
                               (:gripper-opening ?gripper-opening)
                               (:effort ?effort)
                               (:grasp ?grasp)
                               (:left-slice-up-poses ?left-slice-up-poses)
                               (:right-slice-up-poses ?right-slice-up-poses)
                               (:left-slice-down-poses ?left-slice-down-poses)
                               (:right-slice-down-poses ?right-slice-down-poses)
                               (:collision-mode ?collision-mode))
                      ?resolved-action-designator))

;;; action-designator cutting uses this inference to resolve action
(<- (desig:action-grounding ?action-designator (slice-in-half ?resolved-action-designator))
    (spec:property ?action-designator (:type :halving))
    ;; extract info from ?action-designator
    (spec:property ?action-designator (:object ?object-designator))
    (desig:current-designator ?object-designator ?current-object-desig)
    (spec:property ?current-object-desig (:type ?object-type))
    (spec:property ?current-object-desig (:name ?object-name))
    
    ;; infer information which robot arm to use either internally or query ontology
    (-> (spec:property ?action-designator (:arm ?arm))
        (true)
        (man-int:robot-free-hand ?_ ?arm))
    
    (lisp-fun man-int:get-object-old-transform ?current-object-desig ?object-transform)

    ;; infer missing information like ?grasp type, gripping ?maximum-effort, manipulation poses
    (lisp-fun man-int:calculate-object-faces ?object-transform (?facing-robot-face ?bottom-face))
    (-> (man-int:object-rotationally-symmetric ?object-type)
        (equal ?rotationally-symmetric t)
        (equal ?rotationally-symmetric nil))
    
    ;; infer information which grasp to use either internally or query ontology
    (-> (spec:property ?action-designator (:grasp ?grasp))
        (true)
        (and (lisp-fun man-int:get-action-grasps ?object-type ?arm ?object-transform ?grasps)
             (member ?grasp ?grasps)))
    
    ;; infer information where to cut either internally or query ontology
    (-> (spec:property ?action-designator (:object-half-pose ?object-half-pose))
        (true)
        (format "Please infer where to cut the object, or use the query system to infer it here"))
    
    (lisp-fun man-int:get-action-gripping-effort ?object-type ?effort)
    (lisp-fun man-int:get-action-gripper-opening ?object-type ?gripper-opening)

    ;; calculate trajectory
    (equal ?objects (?current-object-desig))
    
    ;; infer information which robot trajectory to use either internally or query ontology
    (-> (equal ?arm :left)
        (and (lisp-fun man-int:get-action-trajectory :halving ?arm ?grasp T ?objects
                       ?left-halving-pose)
             (lisp-fun man-int:get-traj-poses-by-label ?left-halving-pose :halving-up
                       ?left-halving-up-poses)
             (lisp-fun man-int:get-traj-poses-by-label ?left-halving-pose :halving-down
                       ?left-halving-down-poses))
        (and (equal ?left-halcing-up-poses NIL)
             (equal ?left-halving-down-poses NIL)))
    
    (-> (equal ?arm :right)
        (and (lisp-fun man-int:get-action-trajectory :halving ?arm ?grasp T ?objects
                       ?right-halving-pose)
             (lisp-fun man-int:get-traj-poses-by-label ?right-halving-pose :halving-up
                       ?right-halving-up-poses)
             (lisp-fun man-int:get-traj-poses-by-label ?right-halving-pose :halving-down
                       ?right-halving-down-poses))
        (and(equal ?right-halving-up-poses NIL)
            (equal ?right-halving-down-poses NIL)))
    ;; infer information which collision-mode to use either internally or query ontology
    (-> (desig:desig-prop ?action-designator (:collision-mode ?collision-mode))
        (true)
        (equal ?collision-mode nil))
    
    ;;put together resulting action designator
    (desig:designator :action ((:type :halving)
                               (:object ?current-object-desig)
                               (:object-name  ?object-name)
                               (:arm ?arm)
                               (:gripper-opening ?gripper-opening)
                               (:effort ?effort)
                               (:grasp ?grasp)
                               (:left-halving-up-poses ?left-slice-up-poses)
                               (:right-halving-up-poses ?right-slice-up-poses)
                               (:left-halving-down-poses ?left-slice-down-poses)
                               (:right-halving-down-poses ?right-slice-down-poses)
                               (:collision-mode ?collision-mode))
                      ?resolved-action-designator))

