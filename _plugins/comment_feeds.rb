module Jekyll
  class CommentFeedGenerator < Generator
    safe true

    def generate(site)
      site.posts.docs.each do |post|
        site.pages << FeedPage.new(site, site.source, site.dest, post)
      end
    end
  end

  class FeedPage < Page
    def initialize(site, base, dir, post)
      @site = site
      @base = base
      @dir  = dir
      @name =  post.id + '.xml'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'feed_per_post.xml')
      self.data['post_id'] = post.id.sub! '/', ''

    end
  end
end

