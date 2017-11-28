# frozen_string_literal: true

##
# A concern to be mixed into the SolrDocument class in order to provide
# convenient accessors for IIIF manifests embeded in a SolrDocument
module ManifestConcern
  def manifest
    manifest_url = fetch('iiif_manifest_url_ssi', nil)
    return if manifest_url.blank? || !manifest_available?
    manifest_url
  end

  def iiif_drag_n_drop(manifest, width: '40px')
    link_url = format Settings.iiif_dnd_base_url, query: { manifest: manifest }.to_query
    link_to link_url, class: 'iiif-dnd pull-right', data: { turbolinks: false } do
      image_tag 'iiif-drag-n-drop.svg', width: width, alt: 'IIIF Drag-n-drop'
    end
  end
end
