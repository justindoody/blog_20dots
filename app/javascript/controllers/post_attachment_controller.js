import { Controller } from "stimulus"

export default class extends Controller {
    static values = { url: String }

    upload(event) {
        if (event.attachment.file) {
            this.uploadFileAttachment(event.attachment)
        }
    }

    uploadFileAttachment(attachment) {
        this.uploadFile(attachment.file, setProgress, setAttributes)

        function setProgress(progress) {
          attachment.setUploadProgress(progress)
        }

        function setAttributes(attributes) {
          attachment.setAttributes(attributes)
        }
    }

    uploadFile(file, progressCallback, successCallback) {
        var formData = this.createFormData(file)
        var xhr = new XMLHttpRequest()

        xhr.open("POST", this.urlValue, true)
        xhr.setRequestHeader('Accept', 'application/json')

        xhr.upload.addEventListener("progress", function(event) {
          var progress = event.loaded / event.total * 100
          progressCallback(progress)
        })

        xhr.addEventListener("load", function(event) {
            const url = JSON.parse(xhr.response).url

            if (xhr.status == 200) {
                var attributes = {
                    url: `http://blog.localhost${url}`,
                    href: `http://blog.localhost${url}?content-disposition=attachment`
                }
                successCallback(attributes)
            }
        })

        xhr.send(formData)
    }

    createFormData(file) {
        var data = new FormData()
        data.append("Content-Type", file.type)
        data.append("image", file)
        return data
      }
}