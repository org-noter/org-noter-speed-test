(add-to-list 'load-path (concat default-directory "org-mode/lisp"))
(require 'org)
(package-install-file (concat default-directory "pdf-tools/pdf-tools-1.1.0.tar"))
(pdf-tools-install)
(add-to-list 'load-path (concat default-directory "org-noter"))
(require 'org-noter)

(defmacro measure-time (&rest body)
  "Measure the time it takes to evaluate BODY."
  `(let ((time (current-time)))
     ,@body
     (float-time (time-since time))))

(add-hook 'kill-emacs-hook
          (lambda () (package-delete (car (last (assoc 'pdf-tools package-alist))))))

(find-file "org-noter/tests/MobyDick.pdf")
(org-noter)
(pdf-view-fit-page-to-window)
(pdf-view-first-page)
(org-noter-sync-current-page-or-chapter)
