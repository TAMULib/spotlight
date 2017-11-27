class CatalogController < ApplicationController

  helper Openseadragon::OpenseadragonHelper

  include Blacklight::Catalog

  configure_blacklight do |config|

    # solr field configuration for search results/index views
    config.index.title_field = 'title_display'
    config.index.display_type_field = 'display_type'
    config.index.default_canvas_thumbnail = 'default-square-thumbnail-annotation.png'
    config.index.thumbnail_field = :thumbnail_url_ssm
    config.index.square_image_field = :thumbnail_square_url_ssm
    config.index.slideshow_field = :large_image_url_ssm

    config.show.title_field = 'title_full_display'
    config.show.oembed_field = :url_fulltext
    config.show.tile_source_field = :content_metadata_image_iiif_info_ssm

    config.show.partials.insert(1, :viewer)
    config.show.partials << :metadata_button

    config.view.list.thumbnail_field = :thumbnail_square_url_ssm
    config.view.list.partials = [:exhibits_document_header, :index]
    config.view.gallery.partials = [:index_header, :index]
    config.view.gallery.default_canvas_thumbnail = 'default-square-thumbnail-annotation-large.png'
    config.view.masonry.partials = [:index]
    config.view.slideshow.partials = [:index]
    config.view.embed.partials = [:viewer]
    config.view.embed.if = false

    ## Default parameters to send to solr for all search-like requests. See also SolrHelper#solr_search_params
    config.default_solr_params = {
      qt: 'search',
      fl: '*'
    }

    config.document_solr_path = 'get'
    config.document_unique_id_param = 'ids'

    # solr field configuration for search results/index views
    config.index.title_field = 'full_title_tesim'

    config.add_facet_fields_to_solr_request!

    config.add_search_field 'all_fields', label: 'Everything'

    config.add_sort_field 'relevance', sort: 'score desc', label: 'Relevance'

    config.add_field_configuration_to_solr_request!
  end
end
