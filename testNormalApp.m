classdef testNormalApp < matlab.uitest.TestCase
    
    properties
        app
    end
    methods(TestMethodSetup)
        
        function createApp(testCase)
            
            testCase.app = normalApp;
        end
    end
    
    methods(TestMethodTeardown)
        function deleteApp(testCase)
            delete(testCase.app)
        end
    end

    methods (Test)
        function test_startup(testCase)
            import matlab.unittest.constraints.IsEqualTo
            import matlab.unittest.constraints.RelativeTolerance
            
            testCase.choose(testCase.app.stddeviationSlider,1.5);
            testCase.choose(testCase.app.meanSlider,3);
            
            testCase.verifyEqual(testCase.app.x,-10:0.1:10);
            z = (testCase.app.x - 3)/ 1.5;
            expected = 1 / (sqrt(2*pi)*1.5) * exp(-0.5 * z.^2);
            testCase.verifyThat(testCase.app.p,IsEqualTo(expected,'Within',RelativeTolerance(2*eps)));

        end

        function test_meanSlider(testCase)
            import matlab.unittest.constraints.IsEqualTo
            import matlab.unittest.constraints.RelativeTolerance
            
            testCase.choose(testCase.app.stddeviationSlider,1.5);
            testCase.choose(testCase.app.meanSlider,3);
            
            testCase.verifyEqual(testCase.app.x,-10:0.1:10);
            z = (testCase.app.x - 3)/ 1.5;
            expected = 1 / (sqrt(2*pi)*1.5) * exp(-0.5 * z.^2);
            testCase.verifyThat(testCase.app.p,IsEqualTo(expected,'Within',RelativeTolerance(2*eps)));

        end
        
        function test_stdDevSlider(testCase)
            import matlab.unittest.constraints.IsEqualTo
            import matlab.unittest.constraints.RelativeTolerance

            testCase.choose(testCase.app.meanSlider,3);
            testCase.choose(testCase.app.stddeviationSlider,1.5);
            
            testCase.verifyEqual(testCase.app.x,-10:0.1:10);
            z = (testCase.app.x - 3)/ 1.5;
            expected = 1 / (sqrt(2*pi)*1.5) * exp(-0.5 * z.^2);
            testCase.verifyThat(testCase.app.p,IsEqualTo(expected,'Within',RelativeTolerance(2*eps)));
        end
    end
end

