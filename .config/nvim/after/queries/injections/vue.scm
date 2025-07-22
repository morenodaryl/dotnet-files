;; Inject TypeScript in <script lang="ts"> blocks in Vue files

(
  (element
    (start_tag
      (tag_name) @tag
      (attribute
        (attribute_name) @attr
        (#eq? @attr "lang")
        (attribute_value) @val
        (#match? @val "^\"?ts\"?$")))
    (text) @typescript_content
    (#eq? @tag "script"))
  (#set! injection.language "typescript")
  (#set! injection.content @typescript_content)
)

;; Inject SCSS in <style lang="scss"> blocks in Vue files

(
  (element
    (start_tag
      (tag_name) @tag
      (attribute
        (attribute_name) @attr
        (#eq? @attr "lang")
        (attribute_value) @val
        (#match? @val "^\"?scss\"?$")))
    (text) @scss_content
    (#eq? @tag "style"))
  (#set! injection.language "scss")
  (#set! injection.content @scss_content)
)
