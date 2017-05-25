Pod::Spec.new do |s|
s.name         = 'SLQCategories'
s.version      = '1.0.8'
s.license      = { :type => 'MIT', :file => 'LICENSE' }
s.homepage     = 'https://github.com/slq0378'
s.authors      = {'MrSong' => 'slq0378@gmail.com'}
s.summary      = 'iOS分类集合，各种简单易用分类'

s.platform     =  :ios, '7.0'
s.source       =  {:git => 'https://github.com/slq0378/SLQCategories.git', :tag => s.version}
s.source_files =  'SLQCategories/Categories/*.{h,m}'
s.frameworks   =  'AVFoundation'
s.requires_arc = true


	# 子目录
	s.subspec 'UIImage' do |ss|
	ss.source_files = 'SLQCategories/Categories/UIImage/*.{h,m}'
	end

	s.subspec 'UIButton' do |ss|
	ss.source_files = 'SLQCategories/Categories/UIButton/*.{h,m}'
	end

	s.subspec 'UIControl' do |ss|
	ss.source_files = 'SLQCategories/Categories/UIControl/*.{h,m}'
	end

	s.subspec 'UIDevice' do |ss|
	ss.source_files = 'SLQCategories/Categories/UIDevice/*.{h,m}'
	end

	s.subspec 'UIColor' do |ss|
	ss.source_files = 'SLQCategories/Categories/UIColor/*.{h,m}'
	end

	s.subspec 'UIBezierPath' do |ss|
	ss.source_files = 'SLQCategories/Categories/UIBezierPath/*.{h,m}'
	end

	s.subspec 'UIAlertView' do |ss|
	ss.source_files = 'SLQCategories/Categories/UIAlertView/*.{h,m}'
	end

	s.subspec 'UIApplication' do |ss|
	ss.source_files = 'SLQCategories/Categories/UIApplication/*.{h,m}'
	end

	s.subspec 'UIView' do |ss|
	ss.source_files = 'SLQCategories/Categories/UIView/*.{h,m}'
	end

	s.subspec 'UITextField' do |ss|
	ss.source_files = 'SLQCategories/Categories/UITextField/*.{h,m}'
	end

	s.subspec 'UITextView' do |ss|
	ss.source_files = 'SLQCategories/Categories/UITextView/*.{h,m}'
	end

	s.subspec 'NSString' do |ss|
	ss.source_files = 'SLQCategories/Categories/NSString/*.{h,m}'
	end

	s.subspec 'NSDate' do |ss|
	ss.source_files = 'SLQCategories/Categories/NSDate/*.{h,m}'
	end

	s.subspec 'ALAssetsLibrary' do |ss|
	ss.source_files = 'SLQCategories/Categories/ALAssetsLibrary/*.{h,m}'
	end
end