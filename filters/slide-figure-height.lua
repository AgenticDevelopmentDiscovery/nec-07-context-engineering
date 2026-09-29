-- Exists because Beamer sizes figures by height and the document by width.
function Image(img)
  if img.attributes.width then
    img.attributes.width = nil
    img.attributes.height = "70%"
    return img
  end
end
