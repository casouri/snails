(require 'recentf)

(defvar snails-backend-name-recentf-list "recentf-list")

(defun snails-backend-search-recentf-list (input input-ticker update-callback)
  (let (candidates)
    (dolist (file recentf-list)
      (when (or
             (string-equal input "")
             (string-match-p (regexp-quote input) file))
        (add-to-list 'candidates (list file file) t)))
    (funcall
     update-callback
     snails-backend-name-recentf-list
     input-ticker
     candidates)))

(defun snails-backend-do-recentf-list (candidate)
  )

(defvar snails-backend-recentf-list
  '(("name" . snails-backend-name-recentf-list)
    ("search" . snails-backend-search-recentf-list)
    ("do" . snails-backend-do-recentf-list)
    ))

(provide 'snails-backend-recentf-list)